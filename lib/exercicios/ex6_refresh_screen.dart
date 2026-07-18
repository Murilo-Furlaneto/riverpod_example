import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'ex6_refresh_screen.g.dart';

@riverpod
Future<int> randomNumber(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return Random().nextInt(100);
}

class Ex6RefreshScreen extends ConsumerWidget {
  const Ex6RefreshScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberAsync = ref.watch(randomNumberProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio 6: Refresh')),
      body: Center(
        child: numberAsync.when(
          data: (num) => Text('Número: $num', style: const TextStyle(fontSize: 40)),
          error: (e, s) => Text('Erro: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(randomNumberProvider);
          /* 
            DESAFIO: Quando clicar aqui, o número deve ser gerado novamente.
            Por padrão, o FutureProvider guarda o valor em cache.
            
            CORRIJA AQUI: Use o método para "invalidar" ou "recarregar" o provider.
            Dica: ref.invalidate(...) ou ref.refresh(...)
          */
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
