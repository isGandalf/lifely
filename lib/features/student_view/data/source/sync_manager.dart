import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/network_errors.dart';
import 'package:lifely/features/student_view/data/source/local.dart';
import 'package:lifely/features/student_view/data/source/network_info.dart';
import 'package:lifely/features/student_view/data/source/remote.dart';

class SyncManager {
  final MissionLocalSource missionLocalSource;
  final MissionRemoteSource missionRemoteSource;
  final NetworkInfo networkInfo;

  SyncManager({required this.missionLocalSource, required this.networkInfo, required this.missionRemoteSource});

  Future<Either<NetworkErrors, void>> syncAllMissions() async {
    final internetEither = await networkInfo.isInternetAvailable();

    return await internetEither.fold(
      ifLeft: (error) => Left(NoInternetConnection(error: error.error)),
      ifRight: (isConnected) async {
        if (!isConnected) {
          return Left(NoInternetConnection(error: 'No internet connection'));
        }

        // Fetch all unsynced missions locally
        final unsyncedEither = await missionLocalSource
            .getAllUnsyncedMissions();

        return await unsyncedEither.fold(
          ifLeft: (failure) =>
              Left(FetchError(error: failure.message)),
          ifRight: (missions) async {
            for (final mission in missions) {
              // sync missions to remote
              final syncResult = await missionRemoteSource
                  .syncMissionWithRemote(
                mission,
              );
              // Sync missions to local
              if (syncResult.isRight) {
                final syncedMission = mission.copyWith(
                  isSynced: true,
                );
                await missionLocalSource.saveOrUpdateMissionToLocal(syncedMission);
              } else {
                // Optionally handle per-mission failure (e.g., log or continue)
              }
            }
            return const Right(null);
          },
        );
      },
    );
  }
}
