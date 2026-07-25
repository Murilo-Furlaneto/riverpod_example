// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex2_counter_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SimpleCounter)
const simpleCounterProvider = SimpleCounterProvider._();

final class SimpleCounterProvider
    extends $NotifierProvider<SimpleCounter, int> {
  const SimpleCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simpleCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simpleCounterHash();

  @$internal
  @override
  SimpleCounter create() => SimpleCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$simpleCounterHash() => r'6598af32e719292437164e776617211fbfd6e559';

abstract class _$SimpleCounter extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
