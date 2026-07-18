import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ex5_details_screen.g.dart';

/* 
  DESAFIO 5: PARÂMETROS (ANTIGO .FAMILY)
  No Riverpod 3.0, para passar um parâmetro, basta adicioná-lo ao método build.
*/

@riverpod
Future<String> fetchUserDetail(Ref ref, int userId) async {
  await Future.delayed(const Duration(seconds: 1));
  // Simula busca por ID
  return "Usuário ID: $userId - Dados Completos";
}

class Ex5DetailsScreen extends ConsumerWidget {
  const Ex5DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DESAFIO: Como chamar o fetchUserDetailProvider passando o ID 42?
    // Dica: No Riverpod 3.0, você chama como uma função: provider(parametro)
    final userAsync = ref.watch(fetchUserDetailProvider(0)); // CORRIJA O ID PARA 42

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio 5: Parâmetros')),
      body: Center(
        child: userAsync.when(
          data: (data) => Text(data, style: const TextStyle(fontSize: 20)),
          error: (e, s) => Text('Erro: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
