import 'package:flutter/material.dart';
import 'package:lifely/features/rewards/presentation/bloc/rewards_bloc.dart';
import 'package:lifely/features/student_view/presentation/widgets/floating_cart_button.dart';
import 'package:lifely/features/teacher_view/presentation/bloc/products_bloc.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_home.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_nav_enum.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_notifications.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_shop.dart';
import 'package:lifely/features/teacher_view/presentation/widgets/bottom_nav_icon.dart';
import 'package:provider/provider.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  TeacherNavPages currentTeacherPage = TeacherNavPages.home;

  final Map<TeacherNavPages, Widget> _pages = {
    TeacherNavPages.home: const TeacherHome(),
    TeacherNavPages.shop: const TeacherShop(),
    TeacherNavPages.notfications: const TeacherNotifications(),
  };

  Map<TeacherNavPages, Widget> get pages => _pages;

  void _onPageNavigationOptionPressed(TeacherNavPages page) {
    setState(() {
      currentTeacherPage = page;
    });

    if (currentTeacherPage == TeacherNavPages.shop) {
      // Load products when the shop page is selected
      context.read<ProductsBloc>().add(FetchProductsEvent());
      context.read<RewardsBloc>().add(FetchRewardsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: SafeArea(child: pages[currentTeacherPage]!),
      ),
      floatingActionButton: currentTeacherPage == TeacherNavPages.shop
          ? const FloatingCartButton()
          : null,
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
                onTap: () =>
                    _onPageNavigationOptionPressed(TeacherNavPages.home),
                isSelected: currentTeacherPage == TeacherNavPages.home,
                pageName: 'Home',
              ),
              BottomNavIcon(
                icon: Icons.store,
                onTap: () =>
                    _onPageNavigationOptionPressed(TeacherNavPages.shop),
                isSelected: currentTeacherPage == TeacherNavPages.shop,
                pageName: 'Store',
              ),
              BottomNavIcon(
                icon: Icons.notifications_sharp,
                onTap: () => _onPageNavigationOptionPressed(
                  TeacherNavPages.notfications,
                ),
                isSelected: currentTeacherPage == TeacherNavPages.notfications,
                pageName: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
