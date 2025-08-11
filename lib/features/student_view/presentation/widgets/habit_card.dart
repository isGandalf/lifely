import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.containerColorBlue1,
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.primaryAppColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Habit display
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today\'s good habit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '"Kindness makes the world a better place"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Play',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.play_circle_outline,
                            color: AppColors.primaryAppColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_border_purple500_outlined,
                            color: Colors.yellow.shade900,
                          ),
                          const Text(
                            '100',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Image
          Container(
            width: 110,
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/teacher.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
