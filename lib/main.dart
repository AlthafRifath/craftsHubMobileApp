import 'package:craftshubapp/firebase_options.dart';
import 'package:craftshubapp/models/shop.dart';
import 'package:craftshubapp/pages/cart_page.dart';
import 'package:craftshubapp/pages/intro_page.dart';
import 'package:craftshubapp/pages/register_page.dart';
import 'package:craftshubapp/pages/settings_page.dart';
import 'package:craftshubapp/pages/shop_page.dart';
import 'package:craftshubapp/themes/light_mode.dart';
import 'package:craftshubapp/pages/profile_page.dart';
import 'package:craftshubapp/themes/dark_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftshubapp/pages/login_page.dart';
import 'themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(lightmode)),
        ChangeNotifierProvider(create: (context) => Shop()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme:themeProvider.getTheme(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/settings_page': (context) => const SettingsPage(),
        '/profile_page': (context) => const ProfilePage(),
      },
    );
  }
}
