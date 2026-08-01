// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_shopping_cart.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CalculateShoppingCart)
const calculateShoppingCartProvider = CalculateShoppingCartProvider._();

final class CalculateShoppingCartProvider
    extends $NotifierProvider<CalculateShoppingCart, double> {
  const CalculateShoppingCartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculateShoppingCartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculateShoppingCartHash();

  @$internal
  @override
  CalculateShoppingCart create() => CalculateShoppingCart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$calculateShoppingCartHash() =>
    r'4de7044d2763c9fdde8edb3ca907462b9505283b';

abstract class _$CalculateShoppingCart extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
