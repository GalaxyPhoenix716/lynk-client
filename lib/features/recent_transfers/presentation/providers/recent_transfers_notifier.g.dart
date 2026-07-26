// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_transfers_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentTransfersNotifier)
final recentTransfersProvider = RecentTransfersNotifierProvider._();

final class RecentTransfersNotifierProvider
    extends
        $AsyncNotifierProvider<
          RecentTransfersNotifier,
          List<RecentTransferRecord>
        > {
  RecentTransfersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentTransfersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentTransfersNotifierHash();

  @$internal
  @override
  RecentTransfersNotifier create() => RecentTransfersNotifier();
}

String _$recentTransfersNotifierHash() =>
    r'da82b1c5aae8db261e91adf2a4c4403a7cde847a';

abstract class _$RecentTransfersNotifier
    extends $AsyncNotifier<List<RecentTransferRecord>> {
  FutureOr<List<RecentTransferRecord>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<RecentTransferRecord>>,
              List<RecentTransferRecord>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RecentTransferRecord>>,
                List<RecentTransferRecord>
              >,
              AsyncValue<List<RecentTransferRecord>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
