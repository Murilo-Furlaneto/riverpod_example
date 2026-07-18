import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  static final lightMode = ThemeData.light();
  static final darkMode = ThemeData.dark();
  ThemeData theme = lightMode;

  @override
 ThemeData build() {
    return getTheme();
  }

  void toggleMode() {
    theme == lightMode ? darkMode : lightMode;
  }

  ThemeData getTheme() => theme;
}
