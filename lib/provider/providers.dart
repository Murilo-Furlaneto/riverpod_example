import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/data/repository/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});