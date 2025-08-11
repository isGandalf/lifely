import 'package:flutter/material.dart';

class StudentNotifications extends StatelessWidget {
  const StudentNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No notifications',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
