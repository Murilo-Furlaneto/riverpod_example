// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex4_filter_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchTerm)
const searchTermProvider = SearchTermProvider._();

final class SearchTermProvider extends $NotifierProvider<SearchTerm, String> {
  const SearchTermProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchTermProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchTermHash();

  @$internal
  @override
  SearchTerm create() => SearchTerm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchTermHash() => r'9b4b4a2b08c49e61ed49547fe2cabaaf9f220b8f';

abstract class _$SearchTerm extends $Notifier<String> {
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

@ProviderFor(filteredUsers)
const filteredUsersProvider = FilteredUsersProvider._();

final class FilteredUsersProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  const FilteredUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredUsersHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return filteredUsers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$filteredUsersHash() => r'b7ccaed358a43b1178b674a32d677efa2ba42d36';
