import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/providers/transfer_providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/file_size_formatter.dart';
import '../../../../core/widgets/ad_banner_widget.dart';
import '../../domain/entities/transfer.dart';

class SendQrScreen extends ConsumerStatefulWidget {
  final Transfer transfer;
  final String aesKey;
  const SendQrScreen({super.key, required this.transfer, this.aesKey = ''});

  @override
  ConsumerState<SendQrScreen> createState() => _SendQrScreenState();
}

class _SendQrScreenState extends ConsumerState<SendQrScreen> {
  int _secondsRemaining = 600; // 10 minutes timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsRemaining > 0) {
        if (mounted) setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _cancelSessionAndGoHome() async {
    _timer?.cancel();
    ref.read(transferRepositoryProvider).cancelTransfer(widget.transfer.id);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transfer session cancelled.'),
          duration: Duration(seconds: 2),
        ),
      );
      context.go('/home');
    }
  }

  String get _formattedTime {
    final m = _secondsRemaining ~/ 60;
    final s = _secondsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final qrData =
        'https://lynk.app/send/${widget.transfer.id}#${widget.aesKey}';

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _cancelSessionAndGoHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Share Transfer'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _cancelSessionAndGoHome,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 220.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Scan with Lynk App to Download',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Expires in $_formattedTime',
                  style: const TextStyle(
                    color: AppTheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${widget.transfer.totalFiles} files · ${FileSizeFormatter.format(widget.transfer.totalSize)}',
                  style: const TextStyle(color: AppTheme.textSecondary),
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () {
                    context.push(
                      '/scan-qr?attachTransferId=${widget.transfer.id}',
                    );
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text("Scan Receiver's Code"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Done'),
                ),
                const SizedBox(height: 16),
                const AdBannerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
