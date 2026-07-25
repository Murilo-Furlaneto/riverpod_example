// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio_clima_estudante.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentCityEstudante)
const currentCityEstudanteProvider = CurrentCityEstudanteProvider._();

final class CurrentCityEstudanteProvider
    extends $NotifierProvider<CurrentCityEstudante, String> {
  const CurrentCityEstudanteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCityEstudanteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCityEstudanteHash();

  @$internal
  @override
  CurrentCityEstudante create() => CurrentCityEstudante();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentCityEstudanteHash() =>
    r'ddfab6efebe1c76e50e39f39ccf852ca07f83ddb';

abstract class _$CurrentCityEstudante extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(fetchWeatherEstudante)
const fetchWeatherEstudanteProvider = FetchWeatherEstudanteFamily._();

final class FetchWeatherEstudanteProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const FetchWeatherEstudanteProvider._({
    required FetchWeatherEstudanteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchWeatherEstudanteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchWeatherEstudanteHash();

  @override
  String toString() {
    return r'fetchWeatherEstudanteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    final argument = this.argument as String;
    return fetchWeatherEstudante(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeatherEstudanteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchWeatherEstudanteHash() =>
    r'd86d25278ae20db38c1d47f23d6df746b93a81ca';

final class FetchWeatherEstudanteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int>, String> {
  const FetchWeatherEstudanteFamily._()
    : super(
        retry: null,
        name: r'fetchWeatherEstudanteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchWeatherEstudanteProvider call(String city) =>
      FetchWeatherEstudanteProvider._(argument: city, from: this);

  @override
  String toString() => r'fetchWeatherEstudanteProvider';
}

@ProviderFor(FavoriteCitiesEstudante)
const favoriteCitiesEstudanteProvider = FavoriteCitiesEstudanteProvider._();

final class FavoriteCitiesEstudanteProvider
    extends $NotifierProvider<FavoriteCitiesEstudante, List<String>> {
  const FavoriteCitiesEstudanteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteCitiesEstudanteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteCitiesEstudanteHash();

  @$internal
  @override
  FavoriteCitiesEstudante create() => FavoriteCitiesEstudante();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$favoriteCitiesEstudanteHash() =>
    r'6623610d1e97488007a812d55c4d7d4839ba91b0';

abstract class _$FavoriteCitiesEstudante extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
