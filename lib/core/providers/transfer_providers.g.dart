// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transferRemoteDataSource)
final transferRemoteDataSourceProvider = TransferRemoteDataSourceProvider._();

final class TransferRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TransferRemoteDataSource,
          TransferRemoteDataSource,
          TransferRemoteDataSource
        >
    with $Provider<TransferRemoteDataSource> {
  TransferRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TransferRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferRemoteDataSource create(Ref ref) {
    return transferRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferRemoteDataSource>(value),
    );
  }
}

String _$transferRemoteDataSourceHash() =>
    r'4dfed650023097fd680369e97f82bdff163b1f40';

@ProviderFor(transferRepository)
final transferRepositoryProvider = TransferRepositoryProvider._();

final class TransferRepositoryProvider
    extends
        $FunctionalProvider<
          TransferRepository,
          TransferRepository,
          TransferRepository
        >
    with $Provider<TransferRepository> {
  TransferRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransferRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferRepository create(Ref ref) {
    return transferRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferRepository>(value),
    );
  }
}

String _$transferRepositoryHash() =>
    r'cb7a16e3827c055a037309996efaf9a88cf8e719';
