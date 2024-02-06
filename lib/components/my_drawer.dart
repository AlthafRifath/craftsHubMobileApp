import 'package:craftshubapp/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //shop tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // cart tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);

                  // navigate to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () {},
            ),
          ),
        ]
      ),
    );
  }
}