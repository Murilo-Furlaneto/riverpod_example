import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/products_data.dart';
import '../provider/cart_provider.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loja Flutter"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => _showCartDialog(context, ref),
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      ref.watch(cartItemsCountProvider).toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: mockProducts.length,
        itemBuilder: (ctx, i) {
          final product = mockProducts[i];
          final inCart = cartItems.any((item) => item.product.id == product.id);
          final quantity = inCart
              ? cartItems.firstWhere((item) => item.product.id == product.id).quantity
              : 0;

          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text("R\$ ${product.price.toStringAsFixed(2)}"),
                const SizedBox(height: 8),
                if (quantity > 0)
                  Chip(
                    label: Text("No carrinho: $quantity"),
                    backgroundColor: Colors.green[100],
                  ),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(cartProvider.notifier).addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.title} adicionado!"),
                        duration: const Duration(milliseconds: 800),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                  label: const Text("Adicionar"),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: cartItems.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _showCartDialog(context, ref),
              label: Text("Carrinho (${ref.watch(cartItemsCountProvider)})"),
              icon: const Icon(Icons.shopping_cart),
              backgroundColor: Colors.green,
            ),
    );
  }

  void _showCartDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) {
        final cartItems = ref.watch(cartProvider);
        final total = ref.watch(cartTotalProvider);

        return AlertDialog(
          title: const Text("Seu Carrinho"),
          content: SizedBox(
            width: double.maxFinite,
            child: cartItems.isEmpty
                ? const Center(child: Text("Carrinho vazio"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (ctx, i) {
                      final item = cartItems[i];
                      return ListTile(
                        leading: Image.network(item.product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item.product.title),
                        subtitle: Text("R\$ ${item.product.price.toStringAsFixed(2)}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                ref.read(cartProvider.notifier).decreaseQuantity(item.product);
                              },
                            ),
                            Text("${item.quantity}"),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                ref.read(cartProvider.notifier).increaseQuantity(item.product);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ref.read(cartProvider.notifier).removeProduct(item.product);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            if (cartItems.isNotEmpty)
              Text(
                "Total: R\$ ${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Fechar"),
            ),
            if (cartItems.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).clear();
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Compra finalizada! Carrinho limpo.")),
                  );
                },
                child: const Text("Finalizar Compra"),
              ),
          ],
        );
      },
    );
  }
}