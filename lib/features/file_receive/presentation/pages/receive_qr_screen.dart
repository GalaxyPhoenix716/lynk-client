import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/providers/receiver_notifier.dart';
import '../../../../core/theme/app_theme.dart';

class ReceiveQrScreen extends ConsumerStatefulWidget {
  const ReceiveQrScreen({super.key});

  @override
  ConsumerState<ReceiveQrScreen> createState() => _ReceiveQrScreenState();
}

class _ReceiveQrScreenState extends ConsumerState<ReceiveQrScreen> {
  int _secondsRemaining = 600;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(receiverProvider.notifier).createSession());
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 600;
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
    // Safely cancel session and stop polling when the user leaves via back button or pop gesture
    final currentState = ref.read(receiverProvider);
    if (currentState.attachedTransferId == null) {
      ref.read(receiverProvider.notifier).cancelSession();
    }
    super.dispose();
  }

  String get _formattedTime {
    final m = _secondsRemaining ~/ 60;
    final s = _secondsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(receiverProvider);

    ref.listen<ReceiverState>(receiverProvider, (previous, next) {
      if (next.attachedTransferId != null) {
        context.go('/download-progress/${next.attachedTransferId}');
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Receive Files')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              if (state.session != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: QrImageView(
                    data: '{"session_id":"${state.session!.id}"}',
                    version: QrVersions.auto,
                    size: 220.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Scan with Sender Device',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Session expires in $_formattedTime',
                  style: const TextStyle(
                    color: AppTheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Waiting for sender to connect...',
                      style: TextStyle(color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ] else if (state.errorMessage != null) ...[
                const Icon(Icons.error_outline, size: 60, color: AppTheme.error),
                const SizedBox(height: 16),
                Text(
                  state.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppTheme.textPrimary, fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.read(receiverProvider.notifier).createSession();
                    _startTimer();
                  },
                  child: const Text('Retry Session'),
                ),
              ] else ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                const Text(
                  'Generating receive session...',
                  style: TextStyle(color: AppTheme.textSecondary),
                ),
              ],
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  ref.read(receiverProvider.notifier).cancelSession();
                  context.pop();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.error,
                  side: const BorderSide(color: AppTheme.error),
                ),
                child: const Text('Cancel Session'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
