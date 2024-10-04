import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text(
          'Your Cart is Empty!',
          style: TextStyle(fontSize: 24, color: Colors.brown),
        ),
      ),
    );
  }
}
