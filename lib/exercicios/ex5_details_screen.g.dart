// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex5_details_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchUserDetail)
const fetchUserDetailProvider = FetchUserDetailFamily._();

final class FetchUserDetailProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const FetchUserDetailProvider._({
    required FetchUserDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchUserDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUserDetailHash();

  @override
  String toString() {
    return r'fetchUserDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as int;
    return fetchUserDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserDetailHash() => r'49ad8db0bca7e77ea3e87f7fc0f7776e3df6eb0c';

final class FetchUserDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, int> {
  const FetchUserDetailFamily._()
    : super(
        retry: null,
        name: r'fetchUserDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchUserDetailProvider call(int userId) =>
      FetchUserDetailProvider._(argument: userId, from: this);

  @override
  String toString() => r'fetchUserDetailProvider';
}
