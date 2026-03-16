import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/photo_provider.dart';
import 'package:riverpod_example/model/photos.dart';

class PhotoScreen extends ConsumerWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosAsync = ref.watch(photoProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        centerTitle: true,
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(photoProviderProvider);
        },
        child: photosAsync.when(
          data: (photos) => _PhotoList(photos: photos),

          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (err, _) => _ErrorView(
            error: err.toString(),
            onRetry: () => ref.invalidate(photoProviderProvider),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.invalidate(photoProviderProvider),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _PhotoList extends StatelessWidget {
  final List<Photo> photos;

  const _PhotoList({required this.photos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: photos.length,
      separatorBuilder: (_, __) => const Divider(height: 1),

      itemBuilder: (context, index) {
        final photo = photos[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),

          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                /// substitui o placeholder quebrado
                "https://picsum.photos/seed/${photo.id}/150",

                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
            ),
          ),

          title: Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          subtitle: Text(
            "Photo ID: ${photo.id}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),

            const SizedBox(height: 16),

            const Text(
              "Erro ao carregar fotos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              error,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text("Tentar novamente"),
            ),
          ],
        ),
      ),
    );
  }
}