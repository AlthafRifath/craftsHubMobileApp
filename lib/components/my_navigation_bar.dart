import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemSelected;

  const MyNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      backgroundColor: theme.colorScheme.background,
      selectedItemColor: Colors.grey.shade700,
      unselectedItemColor: theme.colorScheme.onSurface.withOpacity(0.6),
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Exit',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    );
  }
}
