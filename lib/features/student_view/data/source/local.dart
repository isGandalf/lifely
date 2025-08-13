import 'package:dart_either/dart_either.dart';
import 'package:isar/isar.dart';
import 'package:lifely/core/errors/mission_errors.dart';
import 'package:lifely/features/student_view/data/model/mission_model.dart';

class MissionLocalSource {
  final Isar db;

  MissionLocalSource({required this.db});

  // Fetch data from local
  Future<Either<MissionErrors, List<MissionModel>>>
  fetchAllMissionsFromLocal() async {
    try {
      final missions = await db.missionModels.where().findAll();

      if (missions.isEmpty) {
        return const Right([]);
      }

      return Right(missions);
    } on Exception catch (e) {
      return Left(
        FetchMissionError(
          message: 'An error occurred while fetching data from local --> $e',
        ),
      );
    } catch (e) {
      return Left(FetchMissionError(message: 'An unexpected error --> $e'));
    }
  }

  // Save list of missions to local
  Future<Either<MissionErrors, void>> saveMissionsToLocal(
    List<MissionModel> missions,
  ) async {
    try {
      await db.writeTxn(() async {
        for (final mission in missions) {
          // Find existing local record by missionId
          final existing = await db.missionModels
              .filter()
              .missionIdEqualTo(mission.missionId)
              .findFirst();

          final missionToSave = MissionModel.fromModelToIsar(
            mission.copyWith(
              isSynced: true,
              isarId:
                  existing?.isarId ?? Isar.autoIncrement, // preserve if exists
            ),
          );

          await db.missionModels.put(missionToSave);
        }
      });
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        SaveMissionToLocalError(message: 'Saving to local failed --> $e'),
      );
    } catch (e) {
      return Left(
        SaveMissionToLocalError(message: 'An unexpected error occured --> $e'),
      );
    }
  }

  // Clear local data which already synced
  Future<Either<MissionErrors, void>> clearAllDataFromLocal() async {
    try {
      await db.writeTxn(() async {
        await db.missionModels.filter().isSyncedEqualTo(true).deleteAll();
      });
      return const Right(null);
    } catch (e) {
      return Left(FetchMissionError(message: '$e'));
    }
  }

  // get all data which are not synced
  Future<Either<MissionErrors, List<MissionModel>>>
  getAllUnsyncedMissions() async {
    try {
      final unSynchedMissions = await db.missionModels
          .filter()
          .isSyncedEqualTo(false)
          .findAll();
      return Right(unSynchedMissions);
    } catch (e) {
      return Left(FetchMissionError(message: '$e'));
    }
  }

  // get mission by id
  Future<Either<MissionErrors, MissionModel>> getMissionById(String id) async {
    try {
      final mission = await db.missionModels
          .filter()
          .missionIdEqualTo(id)
          .findFirst();

      if (mission != null) {
        return Right(mission);
      } else {
        return Left(FetchMissionError(message: 'Not found'));
      }
    } catch (e) {
      return Left(FetchMissionError(message: 'Not found --> $e'));
    }
  }

  // update mission steps and save to local
  Future<Either<MissionErrors, void>> updateMissionStep(
    String missionId,
    bool value,
  ) async {
    try {
      // get mission from local using id
      final mission = await db.missionModels
          .filter()
          .missionIdEqualTo(missionId)
          .findFirst();

      if (mission != null) {
        await db.writeTxn(() async {
          // update steps
          final updatedSteps =
              (value ? mission.completedSteps + 1 : mission.completedSteps - 1)
                  .clamp(0, mission.totalSteps);

          // edit relevant fields
          final updatedMission = mission.copyWith(
            updatedAt: DateTime.now(),
            isSynced: false,
            completedSteps: updatedSteps,
            isarId: mission.isarId,
          );

          // put back in local
          await db.missionModels.put(updatedMission);
        });
      }
      return const Right(null);
    } catch (e) {
      return Left(
        SaveMissionToLocalError(
          message: 'Saving/updating mission failed --> $e',
        ),
      );
    }
  }

  Future<Either<MissionErrors, void>> saveOrUpdateMissionToLocal(
    MissionModel mission,
  ) async {
    try {
      final updatedMission = mission.copyWith(
        isarId: mission.isarId,
        remoteId: mission.remoteId,
        missionId: mission.missionId,
        missionTitle: mission.missionTitle,
        missionDescription: mission.missionDescription,
        isSynced: mission.isSynced,
        updatedAt: DateTime.now(),
        totalSteps: mission.totalSteps,
        completedSteps: mission.completedSteps,
      );

      await db.writeTxn(() async {
        await db.missionModels.put(updatedMission);
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(SaveMissionToLocalError(message: 'AN error occured --> $e'));
    } catch (e) {
      return Left(
        SaveMissionToLocalError(message: 'An expected error occured --> $e'),
      );
    }
  }
}
