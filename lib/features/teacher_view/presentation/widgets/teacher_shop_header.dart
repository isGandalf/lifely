import 'package:flutter/material.dart';
import 'package:lifely/features/rewards/presentation/widgets/rewards_container.dart';

class TeacherShopHeader extends StatelessWidget {
  const TeacherShopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shop',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        RewardsContainer(),
      ],
    );
  }
}
