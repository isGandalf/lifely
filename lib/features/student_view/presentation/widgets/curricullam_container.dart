import 'package:flutter/material.dart';

class CurricullamContainer extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final String imageUrl;
  final String curricullamName;

  const CurricullamContainer({
    super.key,
    required this.borderColor,
    required this.fillColor,
    required this.imageUrl,
    required this.curricullamName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            style: BorderStyle.solid,
            width: 2,
            color: borderColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imageUrl, fit: BoxFit.contain, height: 90),
            Text(
              curricullamName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
