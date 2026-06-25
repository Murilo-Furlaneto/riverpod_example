// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_cep_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ViaCep)
const viaCepProvider = ViaCepProvider._();

final class ViaCepProvider
    extends $AsyncNotifierProvider<ViaCep, ViaCepModel?> {
  const ViaCepProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'viaCepProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$viaCepHash();

  @$internal
  @override
  ViaCep create() => ViaCep();
}

String _$viaCepHash() => r'3b23a3dcee86dfb7e4b3df2e047e1ceaf3a24822';

abstract class _$ViaCep extends $AsyncNotifier<ViaCepModel?> {
  FutureOr<ViaCepModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ViaCepModel?>, ViaCepModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ViaCepModel?>, ViaCepModel?>,
              AsyncValue<ViaCepModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
