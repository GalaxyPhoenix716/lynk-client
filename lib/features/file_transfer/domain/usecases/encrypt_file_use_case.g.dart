// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypt_file_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(encryptFileUseCase)
final encryptFileUseCaseProvider = EncryptFileUseCaseProvider._();

final class EncryptFileUseCaseProvider
    extends
        $FunctionalProvider<
          EncryptFileUseCase,
          EncryptFileUseCase,
          EncryptFileUseCase
        >
    with $Provider<EncryptFileUseCase> {
  EncryptFileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'encryptFileUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$encryptFileUseCaseHash();

  @$internal
  @override
  $ProviderElement<EncryptFileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EncryptFileUseCase create(Ref ref) {
    return encryptFileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EncryptFileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EncryptFileUseCase>(value),
    );
  }
}

String _$encryptFileUseCaseHash() =>
    r'd52ecfb4afb55ea63cb751009f8f1c89c192ed68';
