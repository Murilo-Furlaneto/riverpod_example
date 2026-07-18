import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'desafio_clima_estudante.g.dart';

@riverpod
class CurrentCityEstudante extends _$CurrentCityEstudante {
  @override
  String build() => 'São Paulo';
  void setCity(String city) => state = city;
}

@riverpod
Future<int> fetchWeatherEstudante(Ref ref, String city) async {
  await Future.delayed(const Duration(seconds: 2));
  return 15 + Random().nextInt(20);
}

@riverpod
class FavoriteCitiesEstudante extends _$FavoriteCitiesEstudante {
  @override
  List<String> build() => [];

  void toggleFavorite(String city) {
    if (state.contains(city)) {
      state = state.where((item) => item != city).toList();
    } else {
      state = [...state, city];
    }
  }
}

class DesafioClimaEstudante extends ConsumerWidget {
  const DesafioClimaEstudante({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(currentCityEstudanteProvider);
    final weatherAsync = ref.watch(fetchWeatherEstudanteProvider(city));
    final favorites = ref.watch(favoriteCitiesEstudanteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Desafio de Clima'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(fetchWeatherEstudanteProvider(city));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Atualizando clima...'),
                    duration: Duration(seconds: 1)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (val) {
                if (val.isNotEmpty) {
                  ref.read(currentCityEstudanteProvider.notifier).setCity(val);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Digite uma cidade e aperte Enter',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Clima em $city',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    weatherAsync.when(
                      data: (temp) => Text('$tempºC',
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      error: (error, stackTrace) => Text("Erro: $error"),
                      loading: () => const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref
                            .read(favoriteCitiesEstudanteProvider.notifier)
                            .toggleFavorite(city);
                      },
                      icon: Icon(
                        favorites.contains(city)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favorites.contains(city) ? Colors.red : null,
                      ),
                      label: Text(
                        favorites.contains(city)
                            ? 'Remover'
                            : 'Salvar nos Favoritos',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Favoritas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, i) {
                  final favCity = favorites[i];
                  return ListTile(
                    title: Text(favCity),
                    onTap: () {
                      ref
                          .read(currentCityEstudanteProvider.notifier)
                          .setCity(favCity);
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
