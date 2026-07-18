import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/exercicios/desafio_clima_estudante.dart';
import 'package:riverpod_example/exercicios/desafio_final_clima.dart';
import 'package:riverpod_example/exercicios/ex2_counter_screen.dart';
import 'package:riverpod_example/exercicios/ex3_user_screen.dart';
import 'package:riverpod_example/exercicios/ex4_filter_screen.dart';
import 'package:riverpod_example/exercicios/ex6_refresh_screen.dart';
import 'package:riverpod_example/provider/theme_provider.dart';
import 'package:riverpod_example/screen/counter_page.dart';
import 'package:riverpod_example/screen/form_screen.dart';
import 'package:riverpod_example/screen/photo_screen.dart';
import 'package:riverpod_example/screen/post_screen.dart';
import 'package:riverpod_example/screen/shop_screen.dart';
import 'package:riverpod_example/screen/viacep_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho com Riverpod',
      debugShowCheckedModeBanner: false,
      theme:ThemeData() ,
      home:  DesafioClimaEstudante(),
    );
  }
}