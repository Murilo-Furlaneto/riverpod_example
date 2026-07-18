import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'desafio_final_clima.g.dart';

@riverpod
class CurrentCity extends _$CurrentCity {
  @override
  String build() => 'São Paulo';
  void setCity(String city) => state = city;
}

@riverpod
Future<int> fetchWeather(Ref ref, String city) async {
  await Future.delayed(const Duration(seconds: 2));
  return 15 + Random().nextInt(20);
}

@riverpod
class FavoriteCities extends _$FavoriteCities {
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

class DesafioFinalClima extends ConsumerWidget {
  const DesafioFinalClima({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(currentCityProvider);
    final weatherAsync = ref.watch(fetchWeatherProvider(city));
    final favorites = ref.watch(favoriteCitiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Clima (Resolvido)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(fetchWeatherProvider(city)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (val) => ref.read(currentCityProvider.notifier).setCity(val),
              decoration: const InputDecoration(
                labelText: 'Digite uma cidade e aperte Enter',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Clima em $city', style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 10),
                    weatherAsync.when(
                      data: (temp) => Text('$temp°C', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                      error: (e, s) => Text('Erro: $e'),
                      loading: () => const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => ref.read(favoriteCitiesProvider.notifier).toggleFavorite(city),
                      icon: Icon(favorites.contains(city) ? Icons.favorite : Icons.favorite_border),
                      label: Text(favorites.contains(city) ? 'Remover' : 'Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

