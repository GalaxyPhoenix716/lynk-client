import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/providers/receiver_providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/upload_notifier.dart';

class QrScanHelper {
  /// Processes a barcode detection event and handles routing / session attachment.
  static Future<bool> processBarcodeDetection({
    required BuildContext context,
    required WidgetRef ref,
    required BarcodeCapture capture,
    required String? attachTransferId,
  }) async {
    final rawValue = capture.barcodes.first.rawValue;
    if (rawValue == null) return false;

    // Pattern 1: Clean URL format (https://lynk.app/send/xyz#aesKey or https://lynk.app/receive/abc)
    final uri = Uri.tryParse(rawValue);
    if (uri != null &&
        (uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.host == 'lynk.app') {
      final segments = uri.pathSegments;
      if (segments.length >= 2) {
        final action = segments[0];
        final id = segments[1];
        final aesKey = uri.fragment;
        if (action == 'send') {
          context.go('/download-progress/$id?aesKey=$aesKey');
          return true;
        } else if (action == 'receive') {
          return await handleReceiveSession(
            context: context,
            ref: ref,
            sessionId: id,
            attachTransferId: attachTransferId,
          );
        }
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
