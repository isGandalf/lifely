import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';

class StudentNotifications extends StatefulWidget {
  const StudentNotifications({super.key});

  @override
  State<StudentNotifications> createState() => _StudentNotificationsState();
}

class _StudentNotificationsState extends State<StudentNotifications> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(NotificationLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Notifications',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        BlocConsumer<NotificationBloc, NotificationState>(
          listenWhen: (previous, current) =>
              current is NotificationActionStates,
          buildWhen: (previous, current) =>
              current is NotificationNonActionStates,
          listener: (context, state) {},
          builder: (context, state) {
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
              final notificationList = state.notifications;

              return Expanded(
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    final notification = notificationList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                          Icons.notifications,
                          color: AppColors.primaryAppColor,
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
