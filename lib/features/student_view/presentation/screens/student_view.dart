import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter/material.dart';
import 'package:lifely/core/errors/network_errors.dart';
import 'package:lifely/features/student_view/data/source/network_info.dart';
import 'package:lifely/features/student_view/presentation/bloc/bloc/mission_bloc.dart';
import 'package:lifely/features/student_view/presentation/screens/enum_pages.dart';
import 'package:lifely/features/student_view/presentation/screens/home.dart';
import 'package:lifely/features/notifications/presentation/screens/student_notifications.dart';
import 'package:lifely/features/student_view/presentation/screens/store.dart';
import 'package:lifely/features/student_view/presentation/widgets/bottom_nav_bar_icon.dart';
import 'package:provider/provider.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  StudentNavPage studentNavPage = StudentNavPage.home;
  final NetworkInfo networkInfo = NetworkInfo(connectivity: Connectivity());

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

  void _checkInternetConnection() async {
    final result = await networkInfo.isInternetAvailable();
    final isConnected = result.fold(
      ifLeft: (value) => value,
      ifRight: (value) => value,
    );

    print('Internet availability --> $isConnected');
  }

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    context.read<MissionBloc>().add(MissionSyncEvent());
    context.read<MissionBloc>().add(
      FetchMissionFromRemoteAndSaveToLocalEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),

          // pages load based on bottom nav actions
          child: pages[studentNavPage],
        ),
      ),

      // Bottom navigation actions
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
                isSelected: studentNavPage == StudentNavPage.home,
                pageName: 'Home',
              ),
              BottomNavIcon(
                icon: Icons.store,
                onTap: () => _noNavigationOptionTap(StudentNavPage.store),
                isSelected: studentNavPage == StudentNavPage.store,
                pageName: 'Store',
              ),
              BottomNavIcon(
                icon: Icons.notifications_sharp,
                onTap: () =>
                    _noNavigationOptionTap(StudentNavPage.notifications),
                isSelected: studentNavPage == StudentNavPage.notifications,
                pageName: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
