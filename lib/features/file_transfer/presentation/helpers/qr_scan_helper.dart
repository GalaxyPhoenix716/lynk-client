import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/providers/receiver_providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/upload_notifier.dart';

class QrScanHelper {
  /// Extracts transferId and aesKey from raw URL string.
  static Map<String, String?> extractTransferIdAndKey(String rawValue) {
    final uri = Uri.tryParse(rawValue);
    if (uri == null) return {'transferId': null, 'aesKey': null};

    if (uri.scheme == 'lynk') {
      if (uri.host == 'send' && uri.pathSegments.isNotEmpty) {
        return {'transferId': uri.pathSegments.first, 'aesKey': uri.fragment};
      }
      if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'send') {
        return {'transferId': uri.pathSegments[1], 'aesKey': uri.fragment};
      }
    } else if (uri.scheme == 'https' || uri.scheme == 'http') {
      final segments = uri.pathSegments;
      if (segments.length >= 2 && segments[0] == 'send') {
        return {'transferId': segments[1], 'aesKey': uri.fragment};
      }
    }
    return {'transferId': null, 'aesKey': null};
  }

  /// Pick an image from gallery and scan for QR codes.
  static Future<bool> pickAndScanFromGallery({
    required BuildContext context,
    required WidgetRef ref,
    required MobileScannerController scannerController,
    required String? attachTransferId,
  }) async {
    try {
      final pickerResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (pickerResult == null || pickerResult.files.single.path == null) {
        return false;
      }

      final imagePath = pickerResult.files.single.path!;
      final capture = await scannerController.analyzeImage(imagePath);

      if (capture != null && capture.barcodes.isNotEmpty && context.mounted) {
        return await processBarcodeDetection(
          context: context,
          ref: ref,
          capture: capture,
          attachTransferId: attachTransferId,
        );
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No valid Lynk QR code found in selected photo.'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to read image from gallery.'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
      return false;
    }
  }

  /// Processes a barcode detection event and handles routing / session attachment.
  static Future<bool> processBarcodeDetection({
    required BuildContext context,
    required WidgetRef ref,
    required BarcodeCapture capture,
    required String? attachTransferId,
  }) async {
    final rawValue = capture.barcodes.first.rawValue;
    if (rawValue == null) return false;

    // Pattern 1: URL format (https://lynk.app/send/xyz#aesKey or lynk://send/xyz#aesKey)
    final extracted = extractTransferIdAndKey(rawValue);
    if (extracted['transferId'] != null) {
      final id = extracted['transferId']!;
      final aesKey = extracted['aesKey'] ?? '';
      context.go('/download-progress/$id?aesKey=$aesKey');
      return true;
    }

    final uri = Uri.tryParse(rawValue);
    if (uri != null &&
        (uri.scheme == 'https' ||
            uri.scheme == 'http' ||
            uri.scheme == 'lynk')) {
      final segments = uri.pathSegments;
      if (segments.isNotEmpty && segments[0] == 'receive') {
        final id = segments.length > 1 ? segments[1] : uri.host;
        return await handleReceiveSession(
          context: context,
          ref: ref,
          sessionId: id,
          attachTransferId: attachTransferId,
        );
      }
    }

    // Pattern 2: Legacy JSON format fallback
    try {
      final json = jsonDecode(rawValue);
      if (json is Map<String, dynamic>) {
        if (json.containsKey('transfer_id') && json['transfer_id'] is String) {
          final transferId = json['transfer_id'] as String;
          context.go('/download-progress/$transferId');
          return true;
        } else if (json.containsKey('session_id') &&
            json['session_id'] is String) {
          final sessionId = json['session_id'] as String;
          return await handleReceiveSession(
            context: context,
            ref: ref,
            sessionId: sessionId,
            attachTransferId: attachTransferId,
          );
        }
      }
    } catch (_) {
      // Non-JSON payload
    }

    return false;
  }

  static Future<bool> handleReceiveSession({
    required BuildContext context,
    required WidgetRef ref,
    required String sessionId,
    required String? attachTransferId,
  }) async {
    if (attachTransferId != null && attachTransferId.isNotEmpty) {
      final repo = ref.read(receiverRepositoryProvider);
      final currentAesKey = ref.read(uploadProvider).aesKey;
      final result = await repo.attachTransfer(
        sessionId: sessionId,
        transferId: attachTransferId,
        aesKey: currentAesKey,
      );

      if (context.mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Files successfully sent to receiver!'),
              backgroundColor: AppTheme.secondary,
            ),
          );
          context.pop();
          return true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to pair: ${result.failure?.message}'),
              backgroundColor: AppTheme.error,
            ),
          );
          return false;
        }
      }
      return false;
    } else {
      context.go('/upload?attachToSessionId=$sessionId');
      return true;
    }
  }
}
