import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/data/repository/post_repository.dart';
import 'package:riverpod_example/model/post.dart';
import 'package:riverpod_example/provider/providers.dart';

part 'post_provider.g.dart';

@riverpod
class Posts extends _$Posts {
  static const cacheDuration = Duration(minutes: 5);

  late final PostRepository _repo;

  @override
  Future<List<Post>> build() {
    _repo = ref.watch(postRepositoryProvider);

    final link = ref.keepAlive();
    final timer = Timer(cacheDuration, link.close);

    ref.onDispose(timer.cancel);

    return _repo.fetchPosts();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repo.fetchPosts());
  }
}
