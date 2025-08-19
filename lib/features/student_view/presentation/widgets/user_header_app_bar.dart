import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/notifications/presentation/screens/student_notifications.dart';

class UserHeaderAppBar extends StatelessWidget {
  const UserHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //user image
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryAppColor, width: 3),
                image: const DecorationImage(
                  image: AssetImage('assets/images/luffy-student.png'),
                ),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.grey,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Monkey D. Luffy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),

        // notifications
        BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            int notificationCount = 0;
            late List<NotificationEntity> notificationList;
            if (state is NotificationLoadedState) {
              notificationList = state.notifications
                  .where((noti) => !noti.isRead)
                  .toList();

              notificationCount = notificationList
                  .where((noti) => !noti.isRead)
                  .length;
            }
            return badges.Badge(
              badgeContent: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              position: badges.BadgePosition.topEnd(top: -3, end: -3),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          color: AppColors.scaffoldBackground,
                          padding: const EdgeInsets.all(16),
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height *
                                0.9, // almost full height
                            maxWidth:
                                MediaQuery.of(context).size.width *
                                0.95, // almost full width
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Header
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'You have $notificationCount new notifications',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),

                              // Divider
                              const Divider(height: 1),

                              const SizedBox(height: 5),

                              // Your ListView.builder placeholder
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      notificationCount, // replace with your notifications length
                                  itemBuilder: (context, index) {
                                    final notification =
                                        notificationList[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.notifications_on,
                                            color: AppColors.primaryAppColor,
                                          ),
                                          title: Text(
                                            notification.notificationTitle,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          subtitle: Text(
                                            notification
                                                .notificationDescription,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.notifications_active,
                  color: AppColors.primaryAppColor,
                  size: 30,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
