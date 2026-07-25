import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/providers/receiver_notifier.dart';

class ReceiveQrHelper {
  /// Formats remaining timer seconds into MM:SS format.
  static String formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  /// Cancels active receiver session and navigates back.
  static void cancelSessionAndPop(BuildContext context, WidgetRef ref) {
    ref.read(receiverProvider.notifier).cancelSession();
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/home');
    }
  }
}
