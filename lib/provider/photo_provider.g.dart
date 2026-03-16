// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoProvider)
const photoProviderProvider = PhotoProviderProvider._();

final class PhotoProviderProvider
    extends $AsyncNotifierProvider<PhotoProvider, List<Photo>> {
  const PhotoProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoProviderHash();

  @$internal
  @override
  PhotoProvider create() => PhotoProvider();
}

String _$photoProviderHash() => r'cfb61db1f61bf294098c424eb7408a5f9f63a0f0';

abstract class _$PhotoProvider extends $AsyncNotifier<List<Photo>> {
  FutureOr<List<Photo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Photo>>, List<Photo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Photo>>, List<Photo>>,
              AsyncValue<List<Photo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
