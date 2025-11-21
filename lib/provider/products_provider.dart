import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/data/products_data.dart';
import 'package:riverpod_example/model/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return mockProducts;
});

final reducedProductsProvider = Provider<List<Product>>((ref) {
  final allProducts = ref.watch(productsProvider);
  return allProducts.where((product) => product.price < 100).toList();
});