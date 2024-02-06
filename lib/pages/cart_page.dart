import 'package:craftshubapp/components/my_button.dart';
import 'package:craftshubapp/models/product.dart';
import 'package:craftshubapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Do you want to remove this item from your cart?'),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop the dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  // user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Payment Successful!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your Cart is empty..."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get induviduals item in cart
                      final item = cart[index];

                      // return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    }),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("PAY NOW"),
            ),
          )
        ],
      ),
    );
  }
}
