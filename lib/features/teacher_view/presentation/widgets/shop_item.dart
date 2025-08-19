import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final Color color;
  final String imageUrl;

  const ShopItem({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
