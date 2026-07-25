// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_ex_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterEx)
const counterExProvider = CounterExProvider._();

final class CounterExProvider extends $NotifierProvider<CounterEx, double> {
  const CounterExProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterExProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterExHash();

  @$internal
  @override
  CounterEx create() => CounterEx();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$counterExHash() => r'9dd8c86bb92ff370283fac059b2f0a5afe912615';

abstract class _$CounterEx extends $Notifier<double> {
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
