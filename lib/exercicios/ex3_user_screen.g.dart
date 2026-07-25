// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex3_user_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchUserName)
const fetchUserNameProvider = FetchUserNameProvider._();

final class FetchUserNameProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const FetchUserNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserNameHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return fetchUserName(ref);
  }
}

String _$fetchUserNameHash() => r'5faaaeecd437f730f4aa908f90f390f05a1e2afa';
