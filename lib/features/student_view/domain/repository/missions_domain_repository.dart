import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/mission_errors.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';

abstract interface class MissionsDomainRepository {
  Future<Either<MissionErrors, List<Mission>>>
  fetchAllMissionsFromLocal(); // offline first
  Future<Either<MissionErrors, List<Mission>>> fetchAllMissionsFromRemote();
  Future<Either<MissionErrors, Mission>> getMissionById(String id);
  Future<Either<MissionErrors, void>> updateMissionStep(
    String missionId,
    bool value,
  );
  Future<Either<MissionErrors, void>> saveMissionsToLocal(
    List<Mission> missions,
  );
  Future<Either<MissionErrors, void>> missionSync();
}
