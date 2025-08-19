import 'package:flutter/material.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/announcement_card.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/classrooms.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/resources.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/teacher_header.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Teacher header
        TeacherHeader(),
        SizedBox(height: 20),

        // Announcements
        AnnouncementCard(),
        SizedBox(height: 10),

        // Classrooms
        Text(
          'Classrooms',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Classrooms(),
        SizedBox(height: 10),

        // Resourcess
        Text(
          'Resources',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ResourcesContainer(),
      ],
    );
  }
}
