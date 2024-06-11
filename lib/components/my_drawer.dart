import 'package:craftshubapp/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            // drawer header: logo
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'assets/LogoWithoutName.png',
                  height: 100,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //profile tile
            MyListTile(
              text: "Profile",
              icon: Icons.person,
              onTap: () {
                // pop drawer first
                Navigator.pop(context);

                // navigate to profile page
                Navigator.pushNamed(context, '/profile_page');
              },
            ),

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

            // settings tile
            MyListTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                // pop drawer first
                Navigator.pop(context);

                // navigate to settings page
                Navigator.pushNamed(context, '/settings_page');
              },
            ),

            // contact tile
            MyListTile(
              text: "Contact",
              icon: Icons.contact_phone,
              onTap: () {
                // pop drawer first
                Navigator.pop(context);

                // navigate to contact page
                Navigator.pushNamed(context, '/contact_page');
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
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/intro_page',
              (route) => false,
            ),
          ),
        ),
      ]),
    );
  }
}
