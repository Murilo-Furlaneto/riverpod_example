// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex6_refresh_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(randomNumber)
const randomNumberProvider = RandomNumberProvider._();

final class RandomNumberProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const RandomNumberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomNumberProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomNumberHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return randomNumber(ref);
  }
}

String _$randomNumberHash() => r'370eac175477d2ee84b2d3a925bb2f4f6536bce7';
