import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ex2_counter_screen.g.dart';

// --- Provider para o exercício ---
@riverpod
class SimpleCounter extends _$SimpleCounter {
  @override
  int build() => 0;
  void increment() => state++;
}

/* 
  DESAFIO 2: READ VS WATCH E O REBUILD
  
  Objetivo: Fazer com que o texto da contagem mude na tela quando clicar no botão.
  Atualmente, o botão funciona (o estado muda no provider), mas o texto fica parado no 0.
*/

class Ex2CounterScreen extends ConsumerWidget {
  const Ex2CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ERRO: Você está usando 'read'. O 'read' lê o valor uma única vez e ignora mudanças futuras.
    // CORRIJA AQUI: Qual método faz o widget "observar" e "reconstruir" quando o valor muda?
    final count = ref.read(simpleCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio 2: Contador')),
      body: Center(
        child: Text(
          'Contagem: $count',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dica: No onPressed, o 'read' está correto! 
          // O erro está lá em cima no build.
          ref.read(simpleCounterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
