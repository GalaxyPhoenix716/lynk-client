import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/download_notifier.dart';
import '../../../../core/services/ad_service.dart';
import '../../../../core/theme/app_theme.dart';

class DownloadAdHelper {
  static bool _hasAutoStarted = false;

  static void resetState() {
    _hasAutoStarted = false;
  }

  static void triggerAutomaticDownloadAndAd({
    required BuildContext context,
    required WidgetRef ref,
    required String aesKey,
  }) {
    if (_hasAutoStarted) return;
    _hasAutoStarted = true;

    final notifier = ref.read(downloadProvider.notifier);
    // 1. Immediately start background download stream (0ms delay)
    notifier.startDownload(aesKey: aesKey);

    // 2. Display automatic 3-second countdown dialog without any buttons
    final countdownNotifier = ValueNotifier<int>(3);
    Timer? countdownTimer;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (countdownNotifier.value > 1) {
            countdownNotifier.value--;
          } else {
            timer.cancel();
            if (Navigator.canPop(dialogContext)) {
              Navigator.pop(dialogContext);
            }
            // 3. Automatically launch Interstitial Ad after 3-second countdown
            AdService.showInterstitialAd();
          }
        });

        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: AppTheme.cardBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                const Icon(
                  Icons.cloud_download_outlined,
                  size: 56,
                  color: AppTheme.primary,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Downloading Files...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your download has started in the background! A quick ad will begin shortly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<int>(
                  valueListenable: countdownNotifier,
                  builder: (context, seconds, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Ad starts in ${seconds}s',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      countdownTimer?.cancel();
      countdownNotifier.dispose();
    });
  }
}
