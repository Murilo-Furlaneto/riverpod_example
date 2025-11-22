
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/product.dart';

class GarageSaleCartProvider  extends Notifier<Set<Product>>{
  @override
  Set<Product> build() {
    return {
      Product(id: 1, title: 'Product 1', price: 10, imageUrl: 'https://example.com/product1.jpg'),
    };
  }

  }


  final cartNotifierProvider = NotifierProvider<GarageSaleCartProvider, Set<Product>>((){
    return GarageSaleCartProvider();
  });