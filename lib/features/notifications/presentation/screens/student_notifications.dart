import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/notifications/presentation/screens/language_select.dart';

class StudentNotifications extends StatefulWidget {
  const StudentNotifications({super.key});

  @override
  State<StudentNotifications> createState() => _StudentNotificationsState();
}

class _StudentNotificationsState extends State<StudentNotifications> {
  void onNotificationTileTap(NotificationEntity notification) {
    context.read<NotificationBloc>().add(
      NotificationMarkAsReadEvent(notificationId: notification.notificationId),
    );
    setState(() {
      print(notification.isRead);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LanguageSelect(),
                  ),
                );
              },
              icon: const Icon(Icons.language),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BlocConsumer<NotificationBloc, NotificationState>(
          listenWhen: (previous, current) =>
              current is NotificationActionStates,
          buildWhen: (previous, current) =>
              current is NotificationNonActionStates,
          listener: (context, state) {},
          builder: (context, state) {
            print(state.runtimeType);
            if (state is NotificationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NotificationLoadingFailedState) {
              return const Center(
                child: Text(
                  'Failed to fetch Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              );
            }
            if (state is NotificationLoadedState) {
              final notificationList = state.notifications.reversed.toList();

              return Expanded(
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    final notification = notificationList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                        onTap: () => onNotificationTileTap(notification),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          leading: Icon(
                            notification.isRead
                                ? Icons.circle_notifications_outlined
                                : Icons.circle_notifications_sharp,
                            color: AppColors.primaryAppColor,
                            size: 35,
                          ),
                          title: Text(
                            notification.notificationTitle,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            notification.notificationDescription,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
