// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postRepository)
const postRepositoryProvider = PostRepositoryProvider._();

final class PostRepositoryProvider
    extends $FunctionalProvider<PostRepository, PostRepository, PostRepository>
    with $Provider<PostRepository> {
  const PostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostRepository create(Ref ref) {
    return postRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepository>(value),
    );
  }
}

String _$postRepositoryHash() => r'c2dd467ec7a6f4e6037a0ac545ba6d7524a0458f';

@ProviderFor(viaCepRepository)
const viaCepRepositoryProvider = ViaCepRepositoryProvider._();

final class ViaCepRepositoryProvider
    extends
        $FunctionalProvider<
          ViaCeprepository,
          ViaCeprepository,
          ViaCeprepository
        >
    with $Provider<ViaCeprepository> {
  const ViaCepRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'viaCepRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$viaCepRepositoryHash();

  @$internal
  @override
  $ProviderElement<ViaCeprepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ViaCeprepository create(Ref ref) {
    return viaCepRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ViaCeprepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ViaCeprepository>(value),
    );
  }
}

String _$viaCepRepositoryHash() => r'a351f6d2b41414262aeedf56028da612cac582b8';
