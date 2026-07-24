import 'dart:async';
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

  const ReceiverState({
    this.session,
    this.isPolling = false,
    this.attachedTransferId,
    this.attachedAesKey,
    this.errorMessage,
  });

  ReceiverState copyWith({
    ReceiverSession? session,
    bool? isPolling,
    String? attachedTransferId,
    String? attachedAesKey,
    String? errorMessage,
  }) {
    return ReceiverState(
      session: session ?? this.session,
      isPolling: isPolling ?? this.isPolling,
      attachedTransferId: attachedTransferId ?? this.attachedTransferId,
      attachedAesKey: attachedAesKey ?? this.attachedAesKey,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class ReceiverNotifier extends _$ReceiverNotifier {
  Timer? _pollingTimer;

  @override
  ReceiverState build() => const ReceiverState();

  Future<void> createSession() async {
    state = const ReceiverState(isPolling: true);
    final repo = ref.read(receiverRepositoryProvider);
    final result = await repo.createReceiverSession();

    result.fold(
      (session) {
        state = state.copyWith(session: session, isPolling: true);
        _startPolling(session.id);
      },
      (failure) {
        state = state.copyWith(isPolling: false, errorMessage: failure.message);
      },
    );
  }

  void _startPolling(String sessionId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      final repo = ref.read(receiverRepositoryProvider);
      final result = await repo.getReceiverSession(sessionId);

      result.fold((session) {
        if (session.status == ReceiverSessionStatus.attached &&
            session.transferId != null) {
          _pollingTimer?.cancel();
          state = state.copyWith(
            isPolling: false,
            attachedTransferId: session.transferId,
            attachedAesKey: session.aesKey,
          );
        }
      }, (_) {});
    });
  }

  void cancelSession() {
    _pollingTimer?.cancel();
    if (state.session != null) {
      ref
          .read(receiverRepositoryProvider)
          .cancelReceiverSession(state.session!.id);
    }
    state = const ReceiverState();
  }
}
