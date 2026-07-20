// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decrypt_file_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(decryptFileUseCase)
final decryptFileUseCaseProvider = DecryptFileUseCaseProvider._();

final class DecryptFileUseCaseProvider
    extends
        $FunctionalProvider<
          DecryptFileUseCase,
          DecryptFileUseCase,
          DecryptFileUseCase
        >
    with $Provider<DecryptFileUseCase> {
  DecryptFileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'decryptFileUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$decryptFileUseCaseHash();

  @$internal
  @override
  $ProviderElement<DecryptFileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DecryptFileUseCase create(Ref ref) {
    return decryptFileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DecryptFileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DecryptFileUseCase>(value),
    );
  }
}

String _$decryptFileUseCaseHash() =>
    r'0bcd8180d2b188821743d1d12b63e07d81a2497c';
