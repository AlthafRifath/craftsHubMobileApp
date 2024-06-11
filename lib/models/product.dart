class Product {
  final int id;
  final String name;
  final num price;
  final String description;
  final String imagePath;
  final int? quantity;
  final int shopId;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.quantity,
    required this.shopId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imagePath: json['image'].replaceAll('\\', '/'),
      quantity: json['quantity'],
      shopId: json['shop_id'],
    );
  }
}
