import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/notifications/data/source/local_notification_service.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:lifely/features/student_view/data/source/network_info.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';
import 'package:lifely/features/student_view/domain/usecases/mission_usecases.dart';
import 'package:meta/meta.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  final MissionUsecases missionUsecases;
  final NetworkInfo networkInfo;

  final NotificationUsecases notificationUsecases;
  final LocalNotificationService localNotificationService;

  MissionBloc(
    this.missionUsecases,
    this.networkInfo,
    this.notificationUsecases,
    this.localNotificationService,
  ) : super(MissionInitial()) {
    on<FetchMissionFromRemoteAndSaveToLocalEvent>(
      fetchMissionFromRemoteAndSaveToLocalEvent,
    );
    on<MissionLoadEvent>(missionLoadEvent);
    on<MissionStepPressedEvent>(missionStepPressedEvent);
    on<MissionSyncEvent>(missionSyncEvent);
    on<MissionSubmitButtonPressedEvent>(missionSubmitButtonPressedEvent);
  }

  // Fetch missions from remote
  FutureOr<void> fetchMissionFromRemoteAndSaveToLocalEvent(
    FetchMissionFromRemoteAndSaveToLocalEvent event,
    Emitter<MissionState> emit,
  ) async {
    final checkInternet = await networkInfo.isInternetAvailable();

    checkInternet.fold(
      ifLeft: (failure) async {
        emit(NoInternetConnection());
        // final result = await missionUsecases.fetchAllMissionsFromLocal();
        // return result.fold(
        //   ifLeft: (failure) =>
        //       emit(MissionLoadingFailedState(error: failure.message)),
        //   ifRight: (missions) =>
        //       emit(MissionLoadedState(missionList: missions)),
        // );
      },
      ifRight: (internetAvailable) async {
        final remoteMissionsEither = await missionUsecases
            .fetchAllMissionsFromRemote();

        return remoteMissionsEither.fold(
          ifLeft: (failure) =>
              emit(MissionFetchedFromRemoteAndSavedToLocalFailedState()),
          ifRight: (missions) async {
            await missionUsecases.saveMissionsToLocal(missions);
            emit(MissionFetchedFromRemoteAndSavedToLocalSuccessState());
          },
        );
      },
    );
  }

  // fetch missions from local
  FutureOr<void> missionLoadEvent(
    MissionLoadEvent event,
    Emitter<MissionState> emit,
  ) async {
    emit(MissionLoadingState());
    final result = await missionUsecases.fetchAllMissionsFromLocal();
    return result.fold(
      ifLeft: (error) => emit(MissionLoadingFailedState(error: error.message)),
      ifRight: (missions) => emit(MissionLoadedState(missionList: missions)),
    );
  }

  // mission step pressed
  FutureOr<void> missionStepPressedEvent(
    MissionStepPressedEvent event,
    Emitter<MissionState> emit,
  ) async {
    // update the mission step
    final result = await missionUsecases.updateMissionStep(
      event.missionId,
      event.value,
    );

    result.fold(
      ifLeft: (failure) =>
          emit(MissionStepUpdateFailedState(error: failure.message)),
      ifRight: (_) => emit(MissionStepUpdateSuccessState()),
    );

    // fetch current list of missions from local
    final missionList = await missionUsecases.fetchAllMissionsFromLocal();

    // emit mission state
    return missionList.fold(
      ifLeft: (error) => emit(MissionLoadingFailedState(error: error.message)),
      ifRight: (missions) => emit(MissionLoadedState(missionList: missions)),
    );
  }

  // trigger sync
  FutureOr<void> missionSyncEvent(
    MissionSyncEvent event,
    Emitter<MissionState> emit,
  ) async {
    final result = await missionUsecases.missionSync();
    return result.fold(
      ifLeft: (failure) => emit(SyncFailedState(message: failure.message)),
      ifRight: (_) {
        emit(SyncSuccessState());
        add(MissionLoadEvent());
      },
    );
  }

  // Mission submit button pressed
  FutureOr<void> missionSubmitButtonPressedEvent(
    MissionSubmitButtonPressedEvent event,
    Emitter<MissionState> emit,
  ) async {
    final id = DateTime.now().microsecond;

    await localNotificationService.showNotification(
      id: id,
      title: event.notificationTitle,
      body: event.notificationDescription,
    );

    emit(NotificationSentSuccessState());

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
        add(MissionLoadEvent());
      },
    );
  }
}
