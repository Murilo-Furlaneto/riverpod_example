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

String _$postRepositoryHash() => r'8b77a458fb6ac997316fc1a3cbb8aee1688ec0dd';

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

String _$viaCepRepositoryHash() => r'af295896fa91095f1ce0d1e184cca1af327e8053';
