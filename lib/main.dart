import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/theme.dart';
import 'package:lifely/features/notifications/data/models/notification_model.dart';
import 'package:lifely/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:lifely/features/notifications/data/source/local_notification_service.dart';
import 'package:lifely/features/notifications/data/source/local_notification_source.dart';
import 'package:lifely/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/student_view/data/model/mission_model.dart';
import 'package:lifely/features/student_view/data/repository/missions_data_repository.dart';
import 'package:lifely/features/student_view/data/source/local.dart';
import 'package:lifely/features/student_view/data/source/network_info.dart';
import 'package:lifely/features/student_view/data/source/remote.dart';
import 'package:lifely/features/student_view/data/source/sync_manager.dart';
import 'package:lifely/features/student_view/domain/repository/missions_domain_repository.dart';
import 'package:lifely/features/student_view/domain/usecases/mission_usecases.dart';
import 'package:lifely/features/student_view/presentation/bloc/bloc/mission_bloc.dart';
import 'package:lifely/features/student_view/presentation/screens/student_view.dart';
import 'package:lifely/splash_screen.dart/splash_screen.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*
  ISAR initialization
  */
  // get directory path for storing data and open database
  final directory = await getApplicationDocumentsDirectory();
  final isarDb = await Isar.open([
    MissionModelSchema,
    NotificationModelSchema,
  ], directory: directory.path);

  final MissionLocalSource missionLocalSource = MissionLocalSource(db: isarDb);
  final NetworkInfo networkInfo = NetworkInfo(connectivity: Connectivity());
  final MissionRemoteSource missionRemoteSource = MissionRemoteSource();
  final SyncManager syncManager = SyncManager(
    missionLocalSource: missionLocalSource,
    networkInfo: networkInfo,
    missionRemoteSource: missionRemoteSource,
  );
  final MissionsDomainRepository missionsDomainRepository =
      MissionsDataRepositoryImpl(
        missionRemoteSource: missionRemoteSource,
        missionLocalSource: missionLocalSource,
        networkInfo: networkInfo,
        syncManager: syncManager,
      );
  final MissionUsecases missionUsecases = MissionUsecases(
    missionsDomainRepository: missionsDomainRepository,
  );

  final localNotificationSource = LocalNotificationSource(db: isarDb);
  final notificationRepository = NotificationRepositoryImpl(
    localNotificationSource: localNotificationSource,
  );
  final notificationUsecases = NotificationUsecases(
    notificationRepository: notificationRepository,
  );
  final LocalNotificationService localNotificationService =
      LocalNotificationService();

  // Run app
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => MissionBloc(
            missionUsecases,
            networkInfo,
            notificationUsecases,
            localNotificationService,
          ),
        ),
        BlocProvider(
          create: (context) =>
              NotificationBloc(notificationUsecases, localNotificationService),
        ),
      ],
      child: const Lifely(),
    ),
  );
}

class Lifely extends StatelessWidget {
  const Lifely({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
