import 'package:flutter/material.dart';

class TotalMissionCompletedCountContainer extends StatelessWidget {
  const TotalMissionCompletedCountContainer({
    super.key,
    required this.selectedClass,
    required this.totalMissionsCompleted,
  });

  final String selectedClass;
  final int totalMissionsCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withAlpha(80)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total missions compeleted by $selectedClass',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 10),
                Text(
                  '$totalMissionsCompleted',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.asset('assets/images/mission_completed.png'),
        ],
      ),
    );
  }
}
