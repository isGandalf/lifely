import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lifely/core/theme/theme.dart';
import 'package:lifely/features/cart/data/model/cart_model.dart';
import 'package:lifely/features/cart/data/repository/cart_repository_impl.dart';
import 'package:lifely/features/cart/data/source/cart_source.dart';
import 'package:lifely/features/cart/domain/usecases/cart_usecases.dart';
import 'package:lifely/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lifely/features/dashboard/data/repository/mission_dashboard_repository_impl.dart';
import 'package:lifely/features/dashboard/data/source/dashboard_mission_source.dart';
import 'package:lifely/features/dashboard/domain/usecases/mission_dashboard_usecases.dart';
import 'package:lifely/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:lifely/features/langauge/bloc/language_bloc.dart';
import 'package:lifely/features/notifications/data/models/notification_model.dart';
import 'package:lifely/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:lifely/features/notifications/data/source/local_notification_service.dart';
import 'package:lifely/features/notifications/data/source/local_notification_source.dart';
import 'package:lifely/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/rewards/data/repository/rewards_repository_impl.dart';
import 'package:lifely/features/rewards/data/source/rewards_source.dart';
import 'package:lifely/features/rewards/domain/usecases/rewards_usecases.dart';
import 'package:lifely/features/rewards/presentation/bloc/rewards_bloc.dart';
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
import 'package:lifely/features/teacher_view/data/model/products_model.dart';
import 'package:lifely/features/teacher_view/data/repository/products_repository_impl.dart';
import 'package:lifely/features/teacher_view/data/source/datasources.dart';
import 'package:lifely/features/teacher_view/domain/repository/products_repository.dart';
import 'package:lifely/features/teacher_view/domain/usecases/product_usecases.dart';
import 'package:lifely/features/teacher_view/presentation/bloc/products_bloc.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_view.dart';
import 'package:lifely/l10n/app_localizations.dart';
import 'package:isar/isar.dart';
import 'package:lifely/splash_screen.dart/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    CartModelSchema,
    ProductsModelSchema,
  ], directory: directory.path);

  /*
  Mission related initialization
  */
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

  /*
  Notification related initialization
  */
  final localNotificationSource = LocalNotificationSource(db: isarDb);
  final notificationRepository = NotificationRepositoryImpl(
    localNotificationSource: localNotificationSource,
  );
  final notificationUsecases = NotificationUsecases(
    notificationRepository: notificationRepository,
  );
  final LocalNotificationService localNotificationService =
      LocalNotificationService();

  final MissionBloc missionBloc = MissionBloc(
    missionUsecases,
    networkInfo,
    notificationUsecases,
    localNotificationService,
  );

  /*
  Products related initialization
  */
  final productDatasources = Datasources();
  final ProductsRepository productsRepository = ProductsRepositoryImpl(
    datasources: productDatasources,
  );
  final ProductUsecases productUsecases = ProductUsecases(
    productsRepository: productsRepository,
  );

  /*
  Rewards related initialization using SharedPreferences
  */
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final rewardsSource = RewardsSource(prefs: prefs);
  final rewardsRepository = RewardsRepositoryImpl(rewardsSource: rewardsSource);
  final rewardsUsecases = RewardsUsecases(rewardsRepository: rewardsRepository);

  /*
  Cart related initialization using ISAR
  */
  final cartSource = CartSource(isarDb: isarDb);
  final cartRepository = CartRepositoryImpl(cartSource: cartSource);
  final cartUsecases = CartUsecases(cartRepository: cartRepository);

  /*
  Dashboard related initialization
  */

  final dashboardMissionSource = DashboardMissionSource();
  final missionDashboardRepository = MissionDashboardRepositoryImpl(
    dashboardMissionSource: dashboardMissionSource,
  );
  final missionDashboardUsecases = MissionDashboardUsecases(
    missionDashboardRepository: missionDashboardRepository,
  );

  // Run app
  runApp(
    MultiProvider(
      providers: [
        // Mission Bloc
        BlocProvider(
          create: (context) => MissionBloc(
            missionUsecases,
            networkInfo,
            notificationUsecases,
            localNotificationService,
          ),
        ),

        // Notification Bloc
        BlocProvider(
          create: (context) =>
              NotificationBloc(notificationUsecases, localNotificationService),
        ),

        // Language Bloc
        BlocProvider(create: (context) => LanguageBloc(missionBloc)),

        // Products Bloc
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(productUsecases),
        ),

        // Rewards Bloc
        BlocProvider(create: (context) => RewardsBloc(rewardsUsecases)),

        // Cart Bloc
        BlocProvider(create: (context) => CartBloc(cartUsecases)),

        // Dashboard Bloc
        BlocProvider(
          create: (context) => DashboardBloc(missionDashboardUsecases),
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
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        Locale locale = const Locale('en');

        if (state is LanguageUpdatedState) {
          locale = state.locale;
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('hi')],
          home: const SplashScreen(),
        );
      },
    );
  }
}
