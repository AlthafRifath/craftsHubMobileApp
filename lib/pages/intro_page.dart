import 'package:craftshubapp/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'assets/LogoWithoutName.png',
              height: 110,
            ),

            const SizedBox(height: 25),

            // title
            Text(
              "Crafts Hub",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // subtitle
            Text(
              "Your one stop shop for all things handmade",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
