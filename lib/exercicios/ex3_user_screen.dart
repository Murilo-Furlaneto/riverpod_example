import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ex3_user_screen.g.dart';

// --- Provider para o exercício ---
@riverpod
Future<String> fetchUserName(Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return "Neymar Júnior";
}

/* 
  DESAFIO 3: O DESASTRE DO ASYNCVALUE
  
  Objetivo: Mostrar o nome do usuário que vem de uma "API" (simulada com delay).
  
  O código abaixo vai dar erro de 'null' ou mostrar algo estranho nos primeiros 3 segundos,
  pois ele tenta acessar '.value' antes dos dados chegarem.
*/

class Ex3UserScreen extends ConsumerWidget {
  const Ex3UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(fetchUserNameProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio 3: AsyncValue')),
      body: Center(
        // ERRO: Acessar .value diretamente é perigoso em estados assíncronos.
        // CORRIJA AQUI: Use o método '.when()' do userAsync para tratar:
        // 1. data: (o que mostrar quando o dado chegar)
        // 2. error: (o que mostrar se der erro)
        // 3. loading: (o que mostrar enquanto carrega)
        child: Text(
          'Usuário: ${userAsync.value}', 
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
