import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lifely/core/theme/app_colors.dart';

class TeacherHeader extends StatelessWidget {
  const TeacherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryAppColor, width: 3),
                image: const DecorationImage(
                  image: AssetImage('assets/images/teacher_pic.png'),
                ),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.grey,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Alexander Pique',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),

        badges.Badge(
          badgeContent: const Text(
            '0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -3),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active,
              color: AppColors.primaryAppColor,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
