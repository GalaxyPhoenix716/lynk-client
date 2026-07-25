import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/theme/app_theme.dart';
import '../helpers/qr_scan_helper.dart';

class QrScanScreen extends ConsumerStatefulWidget {
  final String? attachTransferId;
  const QrScanScreen({super.key, this.attachTransferId});

  @override
  ConsumerState<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends ConsumerState<QrScanScreen> {
  bool _scanned = false;

  void _onDetect(BarcodeCapture capture) async {
    if (_scanned) return;
    final success = await QrScanHelper.processBarcodeDetection(
      context: context,
      ref: ref,
      capture: capture,
      attachTransferId: widget.attachTransferId,
    );
    if (success && mounted) {
      setState(() => _scanned = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.attachTransferId != null
              ? 'Scan Receiver QR Code'
              : 'Scan QR Code',
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(onDetect: _onDetect),
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primary, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Text(
              widget.attachTransferId != null
                  ? 'Align receiver QR code within frame to pair'
                  : 'Align sender or receiver QR code within frame',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
