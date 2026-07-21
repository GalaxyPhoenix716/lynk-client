// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$receiverNotifierHash() => r'd2e3f4a5b67890123456789abcdef0123456789a';

@ProviderFor(ReceiverNotifier)
final receiverNotifierProvider = ReceiverNotifierProvider._();

final class ReceiverNotifierProvider
    extends $NotifierProvider<ReceiverNotifier, ReceiverState> {
  ReceiverNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiverNotifierProvider',
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
