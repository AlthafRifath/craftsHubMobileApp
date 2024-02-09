import 'package:craftshubapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftshubapp/themes/theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Switch(
      value: themeProvider.getTheme() == lightmode,
      onChanged: (value) {
        themeProvider.toggleTheme();
      },
    );
  }
}
