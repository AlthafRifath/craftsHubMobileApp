import 'dart:convert';
import 'package:craftshubapp/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('http://192.168.1.2:8000/api/products'));

  if (response.statusCode == 200) {
    List<dynamic> productsJson = jsonDecode(response.body)['data'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
