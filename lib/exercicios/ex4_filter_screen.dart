import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ex4_filter_screen.g.dart';

// 1. Provider para o termo de busca
@riverpod
class SearchTerm extends _$SearchTerm {
  @override
  String build() => '';
  void update(String value) => state = value;
}

// 2. Lista completa (simulada)
final _allUsers = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];

// 3. Provider que DEPENDE do SearchTerm
@riverpod
List<String> filteredUsers(Ref ref) {
  // DESAFIO: Este provider deve "observar" o searchTermProvider.
  // Se o termo mudar, esta lista deve ser filtrada automaticamente.

  // Dica: Use ref.watch(searchTermProvider)
  final search = ref.watch(searchTermProvider); // CORRIJA AQUI

  return _allUsers
      .where((u) => u.toLowerCase().contains(search.toLowerCase()))
      .toList();
}

class Ex4FilterScreen extends ConsumerWidget {
  const Ex4FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(filteredUsersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio 4: Filtros')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                // CORRIJA AQUI: Atualize o searchTermProvider
                ref.read(searchTermProvider.notifier).update(val);
              },
              decoration: const InputDecoration(labelText: 'Buscar usuário...'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) => ListTile(title: Text(users[i])),
            ),
          ),
        ],
      ),
    );
  }
}
