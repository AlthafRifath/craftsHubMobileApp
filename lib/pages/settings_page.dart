import 'package:craftshubapp/components/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:craftshubapp/components/theme_toggle_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: ListTile(
        title: const Text('Dark Mode'),
        trailing: ThemeToggleButton(),
      ),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 0,
        onItemSelected: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/shop_page');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart_page');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings_page');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/intro_page');
          }
        },
      )
    );
  }
}
