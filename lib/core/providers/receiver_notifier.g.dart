// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReceiverNotifier)
final receiverProvider = ReceiverNotifierProvider._();

final class ReceiverNotifierProvider
    extends $NotifierProvider<ReceiverNotifier, ReceiverState> {
  ReceiverNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiverNotifierHash();

  @$internal
  @override
  ReceiverNotifier create() => ReceiverNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiverState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiverState>(value),
    );
  }
}

String _$receiverNotifierHash() => r'709896145cbd69a97e7f1701a1dee6a150e4d9b4';

abstract class _$ReceiverNotifier extends $Notifier<ReceiverState> {
  ReceiverState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ReceiverState, ReceiverState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReceiverState, ReceiverState>,
              ReceiverState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
