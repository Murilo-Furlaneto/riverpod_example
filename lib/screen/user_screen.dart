import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/user_provider.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Usuário')),
      body: Center(
        child: userAsync.when(
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text('Erro: $err'),
          data: (user) {
            if (user == null) return Text('Usuário não encontrado');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nome: ${user.name}', style: TextStyle(fontSize: 24)),
                Text('Email: ${user.email}'),
                ElevatedButton(
                  onPressed: () => ref.read(userProvider.notifier).refresh(),
                  child: Text('Recarregar'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}