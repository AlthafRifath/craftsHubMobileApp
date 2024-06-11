import 'package:craftshubapp/components/my_drawer.dart';
import 'package:craftshubapp/components/my_products_tile.dart';
import 'package:craftshubapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftshubapp/components/my_navigation_bar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Here, you are watching for changes in the Shop model.
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Check if products are not empty, if empty show a loading indicator or placeholder
          if (products.isEmpty)
            const CircularProgressIndicator()
          else
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductsTile(product: product);  // Assuming MyProductsTile takes a product and displays it correctly
                },
              ),
            ),
          const SizedBox(height: 25),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 0,
        onItemSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/shop_page');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart_page');
              break;
            case 2:
              Navigator.pushNamed(context, '/settings_page');
              break;
            case 3:
              Navigator.pushNamed(context, '/intro_page');
              break;
          }
        },
      ),
    );
  }
}
