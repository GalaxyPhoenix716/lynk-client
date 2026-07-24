import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/theme/app_theme.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool _scanned = false;

  void _onDetect(BarcodeCapture capture) {
    if (_scanned) return;
    final rawValue = capture.barcodes.first.rawValue;
    if (rawValue == null) return;

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
          _scanned = true;
          context.go('/download-progress/$id?aesKey=$aesKey');
          return;
        } else if (action == 'receive') {
          _scanned = true;
          context.go('/upload?attachToSessionId=$id');
          return;
        }
      }
    }

    // Pattern 2: Legacy JSON format fallback
    try {
      final json = jsonDecode(rawValue);
      if (json is Map<String, dynamic>) {
        if (json.containsKey('transfer_id') && json['transfer_id'] is String) {
          _scanned = true;
          final transferId = json['transfer_id'] as String;
          context.go('/download-progress/$transferId');
          return;
        } else if (json.containsKey('session_id') &&
            json['session_id'] is String) {
          _scanned = true;
          final sessionId = json['session_id'] as String;
          context.go('/upload?attachToSessionId=$sessionId');
          return;
        }
      }
    } catch (_) {
      // Non-JSON payload
    }

    // If it's a random non-Lynk QR, do absolutely nothing (ignore silently and keep scanner active)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
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
          const Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Text(
              'Align sender or receiver QR code within frame',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
