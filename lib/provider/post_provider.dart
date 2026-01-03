import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/model/post.dart';
import 'package:http/http.dart' as http;

part 'post_provider.g.dart';

@riverpod
class Posts extends _$Posts {
  static const Duration cacheDuration = Duration(minutes: 5);

  @override
  Future<List<Post>> build() async {
    // Mantém o estado vivo por 5 minutos após o último listener sair
    final keepAliveLink = ref.keepAlive();

    final timer = Timer(cacheDuration, (){
      keepAliveLink.close();
    });

    // Cancela o timer se o provider for recriado antes do tempo
    ref.onDispose(timer.cancel);

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),);

    if(response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('falha ao carregar posts: ${response.statusCode}');
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}