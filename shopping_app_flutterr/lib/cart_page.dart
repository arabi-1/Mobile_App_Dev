import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variable.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),

      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
