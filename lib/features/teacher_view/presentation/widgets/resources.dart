import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

class ResourcesContainer extends StatelessWidget {
  const ResourcesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.containerColorYellow2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.containerColorYellow1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tree of knowledge',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Keep your learning up and rewards high with wide range of resources.',
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
            'assets/images/books.png',
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
