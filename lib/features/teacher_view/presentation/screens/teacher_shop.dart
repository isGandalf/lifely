import 'package:flutter/material.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/shop_item_list_view.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/teacher_shop_header.dart';

class TeacherShop extends StatelessWidget {
  const TeacherShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Header
        TeacherShopHeader(),
        SizedBox(height: 20),

        // Shop list
        ShopItemListView(),
      ],
    );
  }
}
