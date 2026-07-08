import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    ref.listen<int>(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('O contador chegou a 10!')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Contador com Riverpod')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contador: $counter',style: TextStyle(fontSize: 18),),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                child: const Text('Decrementar',style: TextStyle(fontSize: 18, color: Colors.black),),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Incrementar',style: TextStyle(fontSize: 18, color: Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
