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

    // access products in shop
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

          // shop subtitle
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          const SizedBox(height: 20),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // get each induvidual product from shop
                final product = products[index];
        
                // return as a product tile UI
                return MyProductsTile(product: product);
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 0,
        onItemSelected: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '');
          } else if (index == 2) {
            Navigator.pushNamed(context, '');
          }
        },
      )
    );
  }
}