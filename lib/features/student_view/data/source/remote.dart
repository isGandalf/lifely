import 'dart:convert';

import 'package:dart_either/dart_either.dart';
import 'package:http/http.dart' as http;
import 'package:lifely/core/errors/mission_errors.dart';
import 'package:lifely/features/student_view/data/model/mission_model.dart';

class MissionRemoteSource {
  static const baseUrl =
      'https://689a37f2fed141b96ba230a5.mockapi.io/missionsapi/missions';

  // fetch all missions from remote
  Future<Either<MissionErrors, List<MissionModel>>> fetchAllMissionsFromRemote() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final missions = jsonList
            .map((json) => MissionModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(missions);
      } else {
        return Left(
          FetchMissionError(
            message: 'Invalid status code --> ${response.statusCode}',
          ),
        );
      }
    } on Exception catch (e) {
      return Left(FetchMissionError(message: 'An error occured --> $e'));
    } catch (e) {
      return Left(
        FetchMissionError(message: 'An unexpected error occured --> $e'),
      );
    }
  }

  // Sync/update mission
  Future<Either<MissionErrors, void>> syncMissionWithRemote(
    MissionModel mission,
  ) async {
    try {
      final url = Uri.parse('$baseUrl/${mission.remoteId}');
      final body = jsonEncode(
        mission.toJson(),
      ); // mission.toJson() should convert Mission to Map<String, dynamic>

      // update existing mission by PUT
      final response = await http.put(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return const Right(null); // Sync success
      } else if (response.statusCode == 404) {
        // If not found, try creating new mission by POST
        final postResponse = await http.post(
          Uri.parse(baseUrl),
          body: body,
          headers: {'Content-Type': 'application/json'},
        );
        if (postResponse.statusCode == 201) {
          return const Right(null); // Created and synced successfully
        } else {
          return Left(
            RemoteSyncError(
              message:
                  'Failed to create mission, status: ${postResponse.statusCode}',
            ),
          );
        }
      } else {
        return Left(
          RemoteSyncError(
            message: 'Failed to update mission, status: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(
        RemoteSyncError(message: 'Exception while syncing mission: $e'),
      );
    }
  }
}
