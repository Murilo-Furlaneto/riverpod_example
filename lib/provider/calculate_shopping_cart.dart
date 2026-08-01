import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/provider/shopping_provider.dart';

part 'calculate_shopping_cart.g.dart';

@riverpod
class CalculateShoppingCart extends _$CalculateShoppingCart {
  @override
  double build() {
    final items = ref.watch(shoppingProvider);

    return items.fold<double>(
      0,
      (sum, item) => sum + item.price,
    );
  }
}