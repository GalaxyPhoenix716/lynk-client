import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/providers/transfer_providers.dart';
import '../providers/upload_notifier.dart';

class SendQrHelper {
  /// Generates the QR data string with embedded transferId and AES key fragment.
  static String buildQrData({
    required WidgetRef ref,
    required String transferId,
    required String aesKey,
  }) {
    final key = aesKey.isNotEmpty
        ? aesKey
        : (ref.read(uploadProvider).aesKey ?? '');
    return 'https://lynk.app/send/$transferId#$key';
  }

  /// Formats seconds into MM:SS format.
  static String formatRemainingTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  /// Cancels transfer session and navigates home.
  static void cancelSessionAndGoHome({
    required BuildContext context,
    required WidgetRef ref,
    required String transferId,
  }) {
    ref.read(transferRepositoryProvider).cancelTransfer(transferId);
    ref.read(uploadProvider.notifier).reset();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Transfer session cancelled.'),
        duration: Duration(seconds: 2),
      ),
    );
    context.go('/home');
  }
}
