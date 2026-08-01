import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/item.dart';
import 'package:riverpod_example/provider/calculate_shopping_cart.dart';
import 'package:riverpod_example/provider/shopping_provider.dart';

class ShoppingScreen extends ConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(shoppingProvider);
    final totalItems = ref.watch(calculateShoppingCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(shoppingProvider.notifier).addProduct(
                            Item(name: 'Maçã', price: 5.0),
                          );
                    },
                    child: const Text('Adicionar Maçã (R\$ 5.00)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(shoppingProvider.notifier).addProduct(
                            Item(name: 'Banana', price: 3.0),
                          );
                    },
                    child: const Text('Adicionar Banana (R\$ 3.00)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Itens no carrinho',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      trailing: Text(
                        'R\$ ${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
           Text(
              'Valor Total: R\$ ${totalItems.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
