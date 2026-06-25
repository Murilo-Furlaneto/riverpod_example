import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:riverpod_example/model/viacep_model.dart';

class ViaCeprepository {
  Future<ViaCepModel> getAddress(String cep) async {
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load address');
      }
      final Map<String,dynamic> data = jsonDecode(response.body);
      return ViaCepModel.fromMap(data);
    } catch (e) {
      log("Failed to load address: $e");
      throw Exception('Failed to load address: $e');
    }
  }
}
