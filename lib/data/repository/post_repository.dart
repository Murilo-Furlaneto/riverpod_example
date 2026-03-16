import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_example/model/post.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os posts: ${response.statusCode}');
    }
  }
}
