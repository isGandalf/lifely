import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';

class BottomNavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final String pageName;

  const BottomNavIcon({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryAppColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            Text(
              pageName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
