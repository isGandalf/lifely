// ignore: implementation_imports
import 'package:dart_either/dart_either.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:lifely/core/errors/mission_errors.dart';
import 'package:lifely/features/student_view/data/model/mission_model.dart';
import 'package:lifely/features/student_view/data/source/local.dart';
import 'package:lifely/features/student_view/data/source/network_info.dart';
import 'package:lifely/features/student_view/data/source/remote.dart';
import 'package:lifely/features/student_view/data/source/sync_manager.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';
import 'package:lifely/features/student_view/domain/repository/missions_domain_repository.dart';

class MissionsDataRepositoryImpl implements MissionsDomainRepository {
  final MissionRemoteSource missionRemoteSource;
  final MissionLocalSource missionLocalSource;
  final NetworkInfo networkInfo;
  final SyncManager syncManager;

  MissionsDataRepositoryImpl({
    required this.missionRemoteSource,
    required this.missionLocalSource,
    required this.networkInfo,
    required this.syncManager,
  });

  // Fetch all missions from remote
  @override
  Future<Either<MissionErrors, List<Mission>>>
  fetchAllMissionsFromRemote() async {
    final missionsFromRemote = await missionRemoteSource
        .fetchAllMissionsFromRemote();
    return missionsFromRemote.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (missions) => Right(missions.map((m) => m.toEntity()).toList()),
    );
  }

  // Fetch all missions from local
  @override
  Future<Either<MissionErrors, List<Mission>>>
  fetchAllMissionsFromLocal() async {
    final missionsFromLocal = await missionLocalSource
        .fetchAllMissionsFromLocal();
    return missionsFromLocal.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (missions) => Right(missions.map((m) => m.toEntity()).toList()),
    );
  }

  // Fetch by mission id
  @override
  Future<Either<MissionErrors, Mission>> getMissionById(String id) async {
    final localEither = await missionLocalSource.getMissionById(id);
    return localEither.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (mission) {
        return Right(mission.toEntity());
      },
    );
  }

  // update a mission step
  @override
  Future<Either<MissionErrors, void>> updateMissionStep(
    String missionId,
    bool value,
  ) async {
    final saveEither = await missionLocalSource.updateMissionStep(
      missionId,
      value,
    );

    // trigger sync
    syncManager.syncAllMissions();

    return saveEither.fold(
      ifLeft: (failure) =>
          Left(SaveMissionToLocalError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  // save all missions to local
  @override
  Future<Either<MissionErrors, void>> saveMissionsToLocal(
    List<Mission> missions,
  ) async {
    try {
      final missionModelList = missions
          .map((e) => MissionModel.fromEntity(e))
          .toList();

      await missionLocalSource.saveMissionsToLocal(missionModelList);
      return const Right(null);
    } on Exception catch (e) {
      return Left(SaveMissionToLocalError(message: 'An error occured --> $e'));
    } catch (e) {
      return Left(
        SaveMissionToLocalError(message: 'An unexpected error occured --> $e'),
      );
    }
  }

  // mission sync
  @override
  Future<Either<MissionErrors, void>> missionSync() async {
    final result = await syncManager.syncAllMissions();
    return result.fold(
      ifLeft: (failure) => Left(RemoteSyncError(message: failure.error)),
      ifRight: (_) => const Right(null),
    );
  }

  // // fetch from remote
  // Future<Either<MissionErrors, List<Mission>>> _getFromRemote() async {
  //   final remoteEither = await missionRemoteSource.fetchAllMissionsFromRemote();
  //   return remoteEither.fold(
  //     ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
  //     ifRight: (models) {
  //       final missions = models.map((e) => e.toEntity()).toList();
  //       return Right(missions);
  //     },
  //   );
  // }

  // // fetch from locale
  // Future<Either<MissionErrors, List<Mission>>> _getFromLocal() async {
  //   final localEither = await missionLocalSource.fetchAllMissionsFromLocal();
  //   return localEither.fold(
  //     ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
  //     ifRight: (models) {
  //       final missions = models.map((e) => e.toEntity()).toList();
  //       return Right(missions);
  //     },
  //   );
  // }
}
