// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_hub_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavigationNotifier)
final navigationProvider = NavigationNotifierProvider._();

final class NavigationNotifierProvider
    extends $NotifierProvider<NavigationNotifier, NavigationHubStore> {
  NavigationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationNotifierHash();

  @$internal
  @override
  NavigationNotifier create() => NavigationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavigationHubStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavigationHubStore>(value),
    );
  }
}

String _$navigationNotifierHash() =>
    r'08145888b8c97ec082c4600870a168281678a61b';

abstract class _$NavigationNotifier extends $Notifier<NavigationHubStore> {
  NavigationHubStore build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NavigationHubStore, NavigationHubStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NavigationHubStore, NavigationHubStore>,
              NavigationHubStore,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
