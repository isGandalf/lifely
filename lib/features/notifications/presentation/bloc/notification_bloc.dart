import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lifely/features/notifications/data/source/local_notification_service.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationUsecases notificationUsecases;
  final LocalNotificationService localNotificationService;
  NotificationBloc(this.notificationUsecases, this.localNotificationService)
    : super(NotificationInitial()) {
    on<NotificationLoadEvent>(onLoadNotifications);
    on<NotificationSaveEvent>(onSaveNotification);
    on<NotificationMarkAsReadEvent>(onMarkNotificationAsRead);
    on<NotificationDeleteEvent>(onDeleteNotification);
    // on<MissionSubmitButtonPressedEvent>(missionSubmitButtonPressedEvent);
  }

  // Fetch notifications from local
  FutureOr<void> onLoadNotifications(
    NotificationLoadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoadingState());
    final result = await notificationUsecases.getAllNotifications();
    return result.fold(
      ifLeft: (failure) =>
          emit(NotificationLoadingFailedState(error: failure.message)),
      ifRight: (notifications) =>
          emit(NotificationLoadedState(notifications: notifications)),
    );
  }

  // Save notification
  FutureOr<void> onSaveNotification(
    NotificationSaveEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final notification = NotificationEntity(
      notificationId: DateTime.now().millisecondsSinceEpoch.toString(),
      notificationTitle: event.notificationTitle,
      notificationDescription: event.notificationDescription,
      createdAt: DateTime.now(),
      isRead: false,
    );

    final result = await notificationUsecases.saveNotification(notification);

    return result.fold(
      ifLeft: (failure) {
        print('Error --> ${failure.message}');
        emit(NotificationSaveFailedState(error: failure.message));
      },
      ifRight: (_) {
        emit(NotificationSaveSuccessState());
        add(NotificationLoadEvent());
      },
    );
  }

  // Mark notification as read
  FutureOr<void> onMarkNotificationAsRead(
    NotificationMarkAsReadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await notificationUsecases.markNotificationRead(
      event.notificationId,
    );

    return result.fold(
      ifLeft: (failure) =>
          emit(NotificationReadFailedState(error: failure.message)),
      ifRight: (_) {
        emit(NotificationReadSuccessState());
        add(NotificationLoadEvent());
      },
    );
  }

  // Delete notification
  FutureOr<void> onDeleteNotification(
    NotificationDeleteEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await notificationUsecases.deleteNotification(
      event.notificationId,
    );
    return result.fold(
      ifLeft: (failure) =>
          emit(NotificationDeleteFailedState(error: failure.message)),
      ifRight: (_) {
        emit(NotificationDeleteSuccessState());
        add(NotificationLoadEvent());
      },
    );
  }

  // FutureOr<void> missionSubmitButtonPressedEvent(
  //   MissionSubmitButtonPressedEvent event,
  //   Emitter<NotificationState> emit,
  // ) async {
  //   final id = DateTime.now().millisecondsSinceEpoch;
  //   await localNotificationService.showNotification(
  //     id: id,
  //     title: event.notificationTitle,
  //     body: event.notificationDescription,
  //   );

  //   emit(NotificationSentSuccessState());

  //   final notification = NotificationEntity(
  //     notificationId: id,
  //     notificationTitle: event.notificationTitle,
  //     notificationDescription: event.notificationDescription,
  //     createdAt: DateTime.now(),
  //     isRead: false,
  //   );

  //   final result = await notificationUsecases.saveNotification(notification);

  //   return result.fold(
  //     ifLeft: (failure) =>
  //         emit(NotificationSaveFailedState(error: failure.message)),
  //     ifRight: (_) => emit(NotificationSaveSuccessState()),
  //   );
  // }
}
