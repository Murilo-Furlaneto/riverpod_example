import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/post_provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts com Cache'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(postsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: postsAsync.when(
        data: (posts) => RefreshIndicator(
          onRefresh: () => ref.read(postsProvider.notifier).refresh(),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) {
              final post = posts[i];
              return ListTile(
                leading: CircleAvatar(child: Text('${post.id}')),
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
        error: (err, stk) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Erro: $err', style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(postsProvider),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Limpar cache agora',
        child: const Icon(Icons.delete_sweep),
        onPressed: () => ref.invalidate(postsProvider),
      ),
    );
  }
}