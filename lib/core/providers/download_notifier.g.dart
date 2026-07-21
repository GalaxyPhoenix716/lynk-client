// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$downloadServiceHash() => r'ec08572f17c9833ac7097aab021d029fc65615ef';

@ProviderFor(downloadService)
final downloadServiceProvider = DownloadServiceProvider._();

final class DownloadServiceProvider
    extends $FunctionalProvider<DownloadService, DownloadService, DownloadService>
    with $Provider<DownloadService> {
  DownloadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadServiceHash();

  @$internal
  @override
  $ProviderElement<DownloadService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadService create(Ref ref) {
    return downloadService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadService>(value),
    );
  }
}

String _$downloadNotifierHash() => r'c1d2e3f4a5b67890123456789abcdef012345678';

@ProviderFor(DownloadNotifier)
final downloadNotifierProvider = DownloadNotifierProvider._();

final class DownloadNotifierProvider
    extends $NotifierProvider<DownloadNotifier, DownloadState> {
  DownloadNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadNotifierHash();

  @$internal
  @override
  DownloadNotifier create() => DownloadNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadState>(value),
    );
  }
}

abstract class _$DownloadNotifier extends $Notifier<DownloadState> {
  DownloadState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DownloadState, DownloadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DownloadState, DownloadState>,
              DownloadState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
