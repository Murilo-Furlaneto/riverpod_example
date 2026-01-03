import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/model/user.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() => fetchUser();

  Future<User?> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    }
    return null;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => fetchUser());
  }
}