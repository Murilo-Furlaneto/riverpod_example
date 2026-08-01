// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Shopping)
const shoppingProvider = ShoppingProvider._();

final class ShoppingProvider extends $NotifierProvider<Shopping, List<Item>> {
  const ShoppingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingHash();

  @$internal
  @override
  Shopping create() => Shopping();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Item> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Item>>(value),
    );
  }
}

String _$shoppingHash() => r'cc2d25f3bed2dba72815dbdf18f0dd9ee1edfeb4';

abstract class _$Shopping extends $Notifier<List<Item>> {
  List<Item> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Item>, List<Item>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Item>, List<Item>>,
              List<Item>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
