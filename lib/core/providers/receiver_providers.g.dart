// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: type=lint, type=warning

@ProviderFor(receiverRemoteDataSource)
final receiverRemoteDataSourceProvider = ReceiverRemoteDataSourceProvider._();

final class ReceiverRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ReceiverRemoteDataSource,
          ReceiverRemoteDataSource,
          ReceiverRemoteDataSource
        >
    with $Provider<ReceiverRemoteDataSource> {
  ReceiverRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiverRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiverRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ReceiverRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReceiverRemoteDataSource create(Ref ref) {
    return receiverRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiverRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiverRemoteDataSource>(value),
    );
  }
}

String _$receiverRemoteDataSourceHash() =>
    r'a1b2c3d4e5f67890123456789abcdef012345678';

@ProviderFor(receiverRepository)
final receiverRepositoryProvider = ReceiverRepositoryProvider._();

final class ReceiverRepositoryProvider
    extends
        $FunctionalProvider<
          ReceiverRepository,
          ReceiverRepository,
          ReceiverRepository
        >
    with $Provider<ReceiverRepository> {
  ReceiverRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiverRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiverRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReceiverRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReceiverRepository create(Ref ref) {
    return receiverRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiverRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiverRepository>(value),
    );
  }
}

String _$receiverRepositoryHash() =>
    r'b2c3d4e5f67890123456789abcdef0123456789';
