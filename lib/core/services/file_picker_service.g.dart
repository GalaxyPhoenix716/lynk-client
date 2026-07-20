// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_picker_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filePickerService)
final filePickerServiceProvider = FilePickerServiceProvider._();

final class FilePickerServiceProvider
    extends
        $FunctionalProvider<
          FilePickerService,
          FilePickerService,
          FilePickerService
        >
    with $Provider<FilePickerService> {
  FilePickerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filePickerServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filePickerServiceHash();

  @$internal
  @override
  $ProviderElement<FilePickerService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FilePickerService create(Ref ref) {
    return filePickerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilePickerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilePickerService>(value),
    );
  }
}

String _$filePickerServiceHash() => r'f8d7110b72c683f1e7ab0ac9770dfe4cc6467395';
