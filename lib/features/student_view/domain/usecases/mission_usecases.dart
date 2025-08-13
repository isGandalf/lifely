import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/mission_errors.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';
import 'package:lifely/features/student_view/domain/repository/missions_domain_repository.dart';

class MissionUsecases {
  final MissionsDomainRepository missionsDomainRepository;

  MissionUsecases({required this.missionsDomainRepository});

  // fetch missions from local
  Future<Either<MissionErrors, List<Mission>>> fetchAllMissionsFromLocal() async {
    final result = await missionsDomainRepository.fetchAllMissionsFromLocal();
    return result.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (missions) => Right(missions),
    );
  }

  // save missions to local
  Future<Either<MissionErrors, void>>
  saveMissionsToLocal(List<Mission> missions) async {
    final result = await missionsDomainRepository.saveMissionsToLocal(missions);
    return result.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  // fetch missions from remote
  Future<Either<MissionErrors, List<Mission>>>
  fetchAllMissionsFromRemote() async {
    final result = await missionsDomainRepository.fetchAllMissionsFromRemote();
    return result.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (missions) => Right(missions),
    );
  }

  // fetch mission by Id
  Future<Either<MissionErrors, Mission>> getMissionById(String id) async {
    final localEither = await missionsDomainRepository.getMissionById(id);
    return localEither.fold(
      ifLeft: (failure) => Left(FetchMissionError(message: failure.message)),
      ifRight: (mission) {
        return Right(mission);
      },
    );
  }

  // update mission step
  Future<Either<MissionErrors, void>> updateMissionStep(
    String missionId,
    bool value,
  ) async {
    final saveEither = await missionsDomainRepository
        .updateMissionStep(missionId, value);

    return saveEither.fold(
      ifLeft: (failure) =>
          Left(SaveMissionToLocalError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  // mission sync
  Future<Either<MissionErrors, void>> missionSync() async {
    final result = await missionsDomainRepository.missionSync();
    return result.fold(
      ifLeft: (failure) => Left(RemoteSyncError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }
}
