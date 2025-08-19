import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:lifely/features/student_view/presentation/bloc/bloc/mission_bloc.dart';
import 'package:lifely/features/student_view/presentation/screens/mission_item_steps.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class MissionList extends StatefulWidget {
  const MissionList({super.key});

  @override
  State<MissionList> createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  final List<ColorPair> colorPairs = [
    ColorPair(
      fillColor: AppColors.containerColorBlue1,
      borderColor: AppColors.containerColorBlue2,
    ),
    ColorPair(
      fillColor: AppColors.containerColorGreen1,
      borderColor: AppColors.containerColorGreen2,
    ),
    ColorPair(
      fillColor: AppColors.containerColorOrange1,
      borderColor: AppColors.containerColorOrange2,
    ),
    ColorPair(
      fillColor: AppColors.containerColorPink1,
      borderColor: AppColors.containerColorPink2,
    ),
    ColorPair(
      fillColor: AppColors.containerColorYellow1,
      borderColor: AppColors.containerColorYellow2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<MissionBloc>().add(MissionLoadEvent());
    context.read<MissionBloc>().add(MissionSyncEvent());
  }

  Future<void> _refreshMissions() async {
    context.read<MissionBloc>().add(MissionSyncEvent());
    context.read<MissionBloc>().add(MissionLoadEvent());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Missions',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<NotificationBloc>().add(NotificationLoadEvent());
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          print(state.runtimeType);

          if (state is MissionLoadingFailedState) {
            print('Error --> ${state.error}');
            return const Center(child: Text('Failed to fetch missions'));
          }
          if (state is MissionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MissionLoadedState) {
            final missionList = state.missionList;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: LiquidPullToRefresh(
                showChildOpacityTransition: false,
                backgroundColor: Colors.white,
                height: 200,
                color: AppColors.primaryAppColor,
                onRefresh: _refreshMissions,
                child: ListView.builder(
                  itemCount: missionList.length,
                  itemBuilder: (context, index) {
                    final missionItem = missionList[index];
                    final color = colorPairs[random.nextInt(colorPairs.length)];

                    final imagePath = 'assets/images';
                    // images
                    final image = switch (missionItem.missionTitle) {
                      'Paper Boat' => '$imagePath/boat.png',
                      'Hot Air Balloon' => '$imagePath/balloon.png',
                      'Paper Plane' => '$imagePath/plane.png',
                      _ => '$imagePath/404.png',
                    };

                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MissionItemSteps(missionItem: missionItem),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 2,
                            color: color.borderColor,
                          ),
                          color: color.fillColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        missionItem.missionTitle,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        missionItem.missionDescription,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              lineHeight: 18,
                              percent:
                                  missionItem.completedSteps /
                                  missionItem.totalSteps,
                              progressColor: Colors.purple,
                              backgroundColor: Colors.deepPurple.shade100,
                              barRadius: const Radius.circular(10),
                              padding: const EdgeInsets.all(0),
                              center: Text(
                                '${(missionItem.completedSteps / missionItem.totalSteps * 100).toInt()} %',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
