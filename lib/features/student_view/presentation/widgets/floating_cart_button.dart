import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lifely/features/cart/presentation/screens/cart_page.dart';

class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {
          context.read<CartBloc>().add(CartFetchEvent());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        backgroundColor: Colors.black,
        shape: const OvalBorder(),
        child: const Icon(Icons.shopping_cart, color: Colors.white, size: 30),
      ),
    );
  }
}
