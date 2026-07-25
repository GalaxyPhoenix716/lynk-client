import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/file_receive/domain/entities/receiver_session.dart';
import 'receiver_providers.dart';

part 'receiver_notifier.g.dart';

class ReceiverState {
  final ReceiverSession? session;
  final bool isPolling;
  final String? attachedTransferId;
  final String? attachedAesKey;
  final String? errorMessage;
  final bool isPausedForBackground;

  const ReceiverState({
    this.session,
    this.isPolling = false,
    this.attachedTransferId,
    this.attachedAesKey,
    this.errorMessage,
    this.isPausedForBackground = false,
  });

  ReceiverState copyWith({
    ReceiverSession? session,
    bool? isPolling,
    String? attachedTransferId,
    String? attachedAesKey,
    String? errorMessage,
    bool? isPausedForBackground,
  }) {
    return ReceiverState(
      session: session ?? this.session,
      isPolling: isPolling ?? this.isPolling,
      attachedTransferId: attachedTransferId ?? this.attachedTransferId,
      attachedAesKey: attachedAesKey ?? this.attachedAesKey,
      errorMessage: errorMessage ?? this.errorMessage,
      isPausedForBackground:
          isPausedForBackground ?? this.isPausedForBackground,
    );
  }
}

@riverpod
class ReceiverNotifier extends _$ReceiverNotifier with WidgetsBindingObserver {
  Timer? _pollingTimer;
  int _pollCount = 0;
  String? _activeSessionId;

  @override
  ReceiverState build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _pollingTimer?.cancel();
    });
    return const ReceiverState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_activeSessionId == null || this.state.attachedTransferId != null) {
      return;
    }

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // Pause polling when app is minimized to preserve battery
      _pollingTimer?.cancel();
      this.state = this.state.copyWith(
        isPolling: false,
        isPausedForBackground: true,
      );
    } else if (state == AppLifecycleState.resumed) {
      // Instantly poll and resume adaptive timer when app is reopened
      this.state = this.state.copyWith(
        isPolling: true,
        isPausedForBackground: false,
      );
      _pollCount = 0;
      _scheduleNextPoll(_activeSessionId!);
    }
  }

  Future<void> createSession() async {
    state = const ReceiverState(isPolling: true);
    _pollCount = 0;
    final repo = ref.read(receiverRepositoryProvider);
    final result = await repo.createReceiverSession();

    result.fold(
      (session) {
        _activeSessionId = session.id;
        state = state.copyWith(session: session, isPolling: true);
        _scheduleNextPoll(session.id);
      },
      (failure) {
        state = state.copyWith(isPolling: false, errorMessage: failure.message);
      },
    );
  }

  void _scheduleNextPoll(String sessionId) {
    _pollingTimer?.cancel();
    if (_activeSessionId != sessionId || state.attachedTransferId != null) {
      return;
    }

    // Adaptive Battery-Saving Polling Strategy:
    // First 10 polls (0-20s): 2s interval for snappy pairing
    // Next 20 polls (20s-100s): 4s interval for power reduction
    // Beyond 100s: 6s interval for ultra-low battery consumption
    final Duration delay = _pollCount < 10
        ? const Duration(seconds: 2)
        : (_pollCount < 30
              ? const Duration(seconds: 4)
              : const Duration(seconds: 6));

    _pollingTimer = Timer(delay, () async {
      if (_activeSessionId != sessionId || state.attachedTransferId != null) {
        return;
      }

      _pollCount++;
      final repo = ref.read(receiverRepositoryProvider);
      final result = await repo.getReceiverSession(sessionId);

      result.fold(
        (session) {
          if (session.status == ReceiverSessionStatus.attached &&
              session.transferId != null) {
            _pollingTimer?.cancel();
            state = state.copyWith(
              isPolling: false,
              attachedTransferId: session.transferId,
              attachedAesKey: session.aesKey,
            );
          } else {
            _scheduleNextPoll(sessionId);
          }
        },
        (_) {
          _scheduleNextPoll(sessionId);
        },
      );
    });
  }

  void cancelSession() {
    _pollingTimer?.cancel();
    final currentSession = state.session;
    _activeSessionId = null;
    if (currentSession != null) {
      ref
          .read(receiverRepositoryProvider)
          .cancelReceiverSession(currentSession.id);
    }
    state = const ReceiverState();
  }
}
