import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/ad_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/file_size_formatter.dart';
import '../../../../core/widgets/ad_banner_widget.dart';
import '../providers/upload_notifier.dart';
import '../providers/upload_state.dart';

class FileUploadScreen extends ConsumerWidget {
  final String? attachToSessionId;

  const FileUploadScreen({super.key, this.attachToSessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);

    ref.listen<UploadState>(uploadProvider, (previous, next) {
      if (next.phase == UploadPhase.completed && next.transfer != null) {
        final key = next.aesKey ?? '';
        context.go('/send-qr?aesKey=$key', extra: next.transfer!);
      } else if (next.phase == UploadPhase.failed && next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Send Files')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              if (uploadState.phase == UploadPhase.idle) ...[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          size: 80,
                          color: AppTheme.primary,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Select files to transfer',
                          style: TextStyle(color: AppTheme.textSecondary),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => notifier.pickFiles(),
                          child: const Text('Choose Files'),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else if (uploadState.phase == UploadPhase.selecting) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.cardBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF2E364F)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${uploadState.selectedFiles.length} files selected',
                      ),
                      Text(
                        '${FileSizeFormatter.format(uploadState.totalSize)} / 500 MB',
                        style: const TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: uploadState.selectedFiles.length,
                    itemBuilder: (context, index) {
                      final f = uploadState.selectedFiles[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(
                            f.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(FileSizeFormatter.format(f.size)),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: AppTheme.error,
                            ),
                            onPressed: () => notifier.removeFile(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => notifier.pickFiles(),
                        child: const Text('+ Add More'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          notifier.startUpload(
                            attachToSessionId: attachToSessionId,
                          );
                          AdService.showInterstitialAd();
                        },
                        child: const Text('Initiate Transfer'),
                      ),
                    ),
                  ],
                ),
              ] else if (uploadState.phase == UploadPhase.uploading) ...[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(uploadState.overallProgress * 100).toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: uploadState.overallProgress,
                        backgroundColor: AppTheme.cardBg,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Uploading file ${uploadState.currentFileIndex + 1} of ${uploadState.selectedFiles.length}',
                      ),
                      const SizedBox(height: 32),
                      OutlinedButton(
                        onPressed: () => notifier.cancelUpload(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.error,
                          side: const BorderSide(color: AppTheme.error),
                        ),
                        child: const Text('Cancel Transfer'),
                      ),
                    ],
                  ),
                ),
              ] else if (uploadState.phase == UploadPhase.failed) ...[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 70,
                          color: AppTheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          uploadState.errorMessage ?? 'Upload failed',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => notifier.pickFiles(),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
