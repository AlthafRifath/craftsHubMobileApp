import 'package:craftshubapp/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: 'Glass Bliss Bowl',
      price: 39.99,
      description: 'Immerse yourself in the delicate beauty of our Glass Bliss Bowl. Handcrafted with precision.',
      imagePath: 'assets/GG1.png'
    ),
    Product(
      name: 'Ethereal Necklace',
      price: 49.99,
      description: 'Introducing our Ethereal Necklace Collection, where each piece tells a story of craftsmanship and elegance.',
      imagePath: 'assets/JW1.png'

    ),
    Product(
      name: 'Mystic Vase Ensemble',
      price: 59.99,
      description: 'Transform your space with our Mystic Vase Ensemble. Each vase is a masterpiece, showcasing a blend of mystique and sophistication.',
      imagePath: 'assets/PT2.png'

    ),
    Product(
      name: 'Artisans Touch Wooden Cutting Board',
      price: 29.99,
      description: 'Experience the Artisans Touch with our Wooden Cutting Board.',
      imagePath: 'assets/WD1.png'

    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

}