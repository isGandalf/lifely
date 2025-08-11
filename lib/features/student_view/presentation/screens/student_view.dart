import 'package:flutter/material.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/student_view/presentation/screens/enum_pages.dart';
import 'package:lifely/features/student_view/presentation/screens/home.dart';
import 'package:lifely/features/student_view/presentation/screens/student_notifications.dart';
import 'package:lifely/features/student_view/presentation/screens/store.dart';
import 'package:lifely/features/student_view/presentation/widgets/bottom_nav_bar_icon.dart';
import 'package:lifely/features/student_view/presentation/widgets/curricullam_container.dart';
import 'package:lifely/features/student_view/presentation/widgets/habit_card.dart';
import 'package:lifely/features/student_view/presentation/widgets/mission_container.dart';
import 'package:lifely/features/student_view/presentation/widgets/user_header_app_bar.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  StudentNavPage studentNavPage = StudentNavPage.home;

  final Map<StudentNavPage, Widget> pages = {
    StudentNavPage.home: const Home(),
    StudentNavPage.store: const Store(),
    StudentNavPage.notifications: const StudentNotifications(),
  };

  void _noNavigationOptionTap(StudentNavPage page) {
    setState(() {
      studentNavPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: pages[studentNavPage],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          side: BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavIcon(
                icon: Icons.home,
                onTap: () => _noNavigationOptionTap(StudentNavPage.home),
                isSelected: studentNavPage == StudentNavPage.home, pageName: 'Home',
              ),
              BottomNavIcon(
                icon: Icons.store,
                onTap: () => _noNavigationOptionTap(StudentNavPage.store),
                isSelected: studentNavPage == StudentNavPage.store, pageName: 'Store',
              ),
              BottomNavIcon(
                icon: Icons.notifications_sharp,
                onTap: () =>
                    _noNavigationOptionTap(StudentNavPage.notifications),
                isSelected: studentNavPage == StudentNavPage.notifications, pageName: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
