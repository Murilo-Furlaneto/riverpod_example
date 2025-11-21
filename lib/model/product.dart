class Product {
  final int id;
  String title;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

class ProductInCart {
  final Product product;
  int quantity;

  ProductInCart({required this.product, this.quantity = 1});

  double get total => product.price * quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductInCart &&
          runtimeType == other.runtimeType &&
          product.id == other.product.id;

  @override
  int get hashCode => product.id.hashCode;
}