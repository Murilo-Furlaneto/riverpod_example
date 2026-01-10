import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/post_provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    ref.listen(postsProvider, (previous, next) {
      if (next is AsyncData) {}
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts com Cache (Riverpod)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(postsProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: postsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Erro: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () => ref.read(postsProvider.notifier).refresh(),
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            ),
        data:
            (posts) => RefreshIndicator(
              onRefresh: () => ref.read(postsProvider.notifier).refresh(),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(child: Text('${post.id}')),
                  );
                },
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.invalidate(postsProvider),
        tooltip: 'Invalidar cache imediatamente',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
