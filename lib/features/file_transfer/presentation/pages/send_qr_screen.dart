import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
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
  final GlobalKey _qrKey = GlobalKey();

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

  Future<void> _shareQrImage() async {
    try {
      final boundary =
          _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData == null) return;

      final pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/lynk_qr.png');
      await file.writeAsBytes(pngBytes);

      await Share.shareXFiles([
        XFile(file.path),
      ], text: 'Scan this QR code with Lynk App to download files.');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to share QR image: $e')));
      }
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
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        // Safe back navigation: preserve session in background
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Share Transfer'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/home'),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                RepaintBoundary(
                  key: _qrKey,
                  child: Container(
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
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _shareQrImage,
                  icon: const Icon(Icons.share),
                  label: const Text('Share QR Image'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _cancelSessionAndGoHome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.error,
                  ),
                  child: const Text('Cancel Session'),
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
