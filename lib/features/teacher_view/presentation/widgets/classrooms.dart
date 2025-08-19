import 'package:flutter/material.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> classrooms = [
      "Class I",
      "Class II",
      "Class III",
      "Class IV",
      "Class V",
    ];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classrooms[index];
          return Container(
            width: 130,
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              border: BoxBorder.all(
                style: BorderStyle.solid,
                color: Colors.amber.shade400,
                width: 10,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                classroom,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
