import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

class MissionContainer extends StatelessWidget {
  const MissionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.containerColorGreen2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.containerColorGreen1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Missions',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore and learn with missions. Earn rewards and more.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/missions.png',
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
