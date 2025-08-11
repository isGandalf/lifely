import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

class UserHeaderAppBar extends StatelessWidget {
  const UserHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //user image
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryAppColor, width: 3),
                image: const DecorationImage(
                  image: AssetImage('assets/images/luffy-student.png'),
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
                  'Monkey D. Luffy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),

        // notifications
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_active,
            color: AppColors.primaryAppColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
