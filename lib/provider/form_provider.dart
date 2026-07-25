import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_provider.g.dart';

@riverpod
class FormController extends _$FormController {
  @override
  bool build() {
    // Retornamos false inicialmente para evitar problemas com valores nulos
    return false;
  }

  void validateForm(
    GlobalKey<FormState> formKey,
    String name,
    String email,
    String password,
  ) {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (isFormValid &&
        validateName(name) &&
        validateEmail(email) &&
        validatePassword(password)) {
      state = false;
      state = true;
    } else {
      state = false;
    }
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 6 && password.isNotEmpty;
  }

  bool validateName(String name) {
    return name.isNotEmpty;
  }
}
