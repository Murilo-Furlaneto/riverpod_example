// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio_final_clima.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentCity)
const currentCityProvider = CurrentCityProvider._();

final class CurrentCityProvider extends $NotifierProvider<CurrentCity, String> {
  const CurrentCityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCityHash();

  @$internal
  @override
  CurrentCity create() => CurrentCity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentCityHash() => r'f40c2df1308acf2fd8044428e027d5ccb8ad1d9e';

abstract class _$CurrentCity extends $Notifier<String> {
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

@ProviderFor(fetchWeather)
const fetchWeatherProvider = FetchWeatherFamily._();

final class FetchWeatherProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const FetchWeatherProvider._({
    required FetchWeatherFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchWeatherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchWeatherHash();

  @override
  String toString() {
    return r'fetchWeatherProvider'
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
    return fetchWeather(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeatherProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchWeatherHash() => r'a656bc35fe9a054c8335e221daf1838e7dc75139';

final class FetchWeatherFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int>, String> {
  const FetchWeatherFamily._()
    : super(
        retry: null,
        name: r'fetchWeatherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchWeatherProvider call(String city) =>
      FetchWeatherProvider._(argument: city, from: this);

  @override
  String toString() => r'fetchWeatherProvider';
}

@ProviderFor(FavoriteCities)
const favoriteCitiesProvider = FavoriteCitiesProvider._();

final class FavoriteCitiesProvider
    extends $NotifierProvider<FavoriteCities, List<String>> {
  const FavoriteCitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteCitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteCitiesHash();

  @$internal
  @override
  FavoriteCities create() => FavoriteCities();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$favoriteCitiesHash() => r'e49582def56cbbf5e9710e26638396b39efe591e';

abstract class _$FavoriteCities extends $Notifier<List<String>> {
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
