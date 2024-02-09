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
    );
  }
}
