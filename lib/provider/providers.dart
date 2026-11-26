import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/data/repository/post_repository.dart';
import 'package:riverpod_example/data/repository/viacep_repository.dart';

part 'providers.g.dart';


@riverpod
PostRepository postRepository(Ref ref) {
  return PostRepository();
}


@riverpod
ViaCeprepository viaCepRepository(Ref ref) {
  return ViaCeprepository();
}