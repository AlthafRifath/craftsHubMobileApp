import 'package:craftshubapp/models/product.dart';

class Shop {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: '100',
      description: 'This is a product description',
    ),
    Product(
      name: 'Product 2',
      price: '200',
      description: 'This is a product description',
    ),
    Product(
      name: 'Product 3',
      price: '300',
      description: 'This is a product description',
    ),
    Product(
      name: 'Product 4',
      price: '400',
      description: 'This is a product description',
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
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
  }

}