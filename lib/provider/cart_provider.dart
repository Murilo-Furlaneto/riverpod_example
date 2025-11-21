import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../model/product.dart';

class CartNotifier extends StateNotifier<List<ProductInCart>> {
  CartNotifier() : super([]);

  void addProduct(Product product) {
    final existingIndex = state.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      state[existingIndex].quantity++;
      state = [...state]; 
    } else {
      state = [...state, ProductInCart(product: product)];
    }
  }

  void removeProduct(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  void increaseQuantity(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      state[index].quantity++;
      state = [...state];
    }
  }

  void decreaseQuantity(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (state[index].quantity <= 1) {
        removeProduct(product);
      } else {
        state[index].quantity--;
        state = [...state];
      }
    }
  }

  void clear() => state = [];

  double get totalAmount {
    return state.fold(0, (sum, item) => sum + item.total);
  }

  int get totalItems => state.fold(0, (sum, item) => sum + item.quantity);
}

final cartProvider = StateNotifierProvider<CartNotifier, List<ProductInCart>>((ref) {
  return CartNotifier();
});

final cartTotalProvider = Provider<double>((ref) {
  return ref.watch(cartProvider.notifier).totalAmount;
});

final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).fold(0, (sum, item) => sum + item.quantity);
});