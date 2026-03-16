import 'dart:convert';

import 'package:riverpod_example/model/photos.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  final String _url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> getPhotos() async {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => Photo.fromMap(e)).toList();
      } else {
        throw Exception('Erro ao carregar as fotos');
      }
    
  }
}
