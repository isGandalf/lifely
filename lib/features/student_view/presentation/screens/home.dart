import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/student_view/presentation/widgets/curricullam_container.dart';
import 'package:lifely/features/student_view/presentation/widgets/habit_card.dart';
import 'package:lifely/features/student_view/presentation/widgets/mission_container.dart';
import 'package:lifely/features/student_view/presentation/widgets/user_header_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user header
        const UserHeaderAppBar(),
        const SizedBox(height: 20),

        // habit section
        const HabitCard(),
        const SizedBox(height: 20),

        // curricullam section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CurricullamContainer(
              borderColor: AppColors.containerColorBlue2,
              fillColor: AppColors.containerColorBlue1,
              imageUrl: 'assets/images/student.png',
              curricullamName: 'Alphabets',
            ),
            const SizedBox(width: 20),
            CurricullamContainer(
              borderColor: AppColors.containerColorPink2,
              fillColor: AppColors.containerColorPink1,
              imageUrl: 'assets/images/cat.png',
              curricullamName: 'Numbers',
            ),
            const SizedBox(width: 20),
            CurricullamContainer(
              borderColor: AppColors.containerColorOrange2,
              fillColor: AppColors.containerColorOrange1,
              imageUrl: 'assets/images/fox.png',
              curricullamName: 'Symbols',
            ),
          ],
        ),
        const SizedBox(height: 20),

        /*
        Missions
        ====================================
        This is the only working feature of the app. (Task 1)
        ====================================
        */
        const MissionContainer(),
      ],
    );
  }
}
