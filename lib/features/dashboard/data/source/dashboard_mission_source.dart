import 'package:lifely/features/dashboard/data/models/class_mission_model.dart';
import 'package:lifely/features/dashboard/data/source/dummy_data.dart';

class DashboardMissionSource {
  List<ClassMissionModel> fetchClassMissions() {
    final classMissionList = dummyData;
    return classMissionList;
  }
}
