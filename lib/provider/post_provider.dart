import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/data/repository/post_repository.dart';
import 'package:riverpod_example/model/post.dart';

part 'post_provider.g.dart';

@riverpod
class Posts extends _$Posts {
  static const Duration cacheDuration = Duration(minutes: 5);
  final PostRepository _repository = PostRepository();

  @override
  Future<List<Post>> build() async {
    final keepAliveLink = ref.keepAlive();

    final timer = Timer(cacheDuration, (){
      keepAliveLink.close();
    });

    ref.onDispose(timer.cancel);

   return await fetchPosts();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<List<Post>> fetchPosts() async {
    return _repository.fetchPosts();
  }
}


