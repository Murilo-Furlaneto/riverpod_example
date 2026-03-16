import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/data/repository/photo_repository.dart';
import 'package:riverpod_example/model/photos.dart';

part 'photo_provider.g.dart';

@riverpod
class PhotoProvider extends _$PhotoProvider {
  final PhotoRepository _repository = PhotoRepository();

  @override
  Future<List<Photo>> build() async {
    return _repository.getPhotos();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.getPhotos());
  }
}