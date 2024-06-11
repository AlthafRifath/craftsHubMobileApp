import 'package:craftshubapp/models/product.dart';
import 'package:craftshubapp/services/api_service.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  List<Product> _shop = [];

  Shop() {
    fetchProducts().then((products) {
      _shop = products;
      notifyListeners(); // This call tells the widgets that something changed
    }).catchError((error) {
      // Handle errors, perhaps by showing an alert dialog
      print("Failed to fetch products: $error");
    });
  }

  // user cart 
  List<Product> _cart = [];

  // get product list 
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to the cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item from the cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
