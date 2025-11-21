import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/products_provider.dart';
import 'package:riverpod_example/shared/cart_icon.dart';

class GarageSaleScreen extends ConsumerWidget {
  const GarageSaleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final garageSaleProducts = ref.watch(reducedProductsProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: garageSaleProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder:(context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(children: [
                Image.asset(garageSaleProducts[index].imageUrl, height: 60,),
                Text(garageSaleProducts[index].title),
                Text('\$${garageSaleProducts[index].price}'),
              ],),
            );
          },
        ),
      ),
    );
  }
}