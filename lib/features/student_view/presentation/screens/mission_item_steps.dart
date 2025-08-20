import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';
import 'package:lifely/features/student_view/presentation/bloc/bloc/mission_bloc.dart';
import 'package:lifely/l10n/app_localizations.dart';

class MissionItemSteps extends StatefulWidget {
  final Mission missionItem;
  const MissionItemSteps({super.key, required this.missionItem});

  @override
  State<MissionItemSteps> createState() => _MissionItemStepsState();
}

class _MissionItemStepsState extends State<MissionItemSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.missionItem.missionTitle,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          int completedSteps = widget.missionItem.completedSteps;

          if (state is MissionLoadingFailedState) {
            return const Center(
              child: Text('Issue occued to fetch mission data'),
            );
          }

          if (state is MissionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MissionLoadedState) {
            final mission = state.missionList.firstWhere(
              (m) => m.missionId == widget.missionItem.missionId,
              orElse: () => widget.missionItem,
            );
            completedSteps = mission.completedSteps;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Steps
                  Expanded(
                    child: ListView.builder(
                      itemCount: mission.totalSteps,
                      itemBuilder: (context, index) {
                        bool isCompleted = index < completedSteps;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: isCompleted ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isCompleted,
                                checkColor: Colors.white,
                                activeColor: isCompleted
                                    ? Colors.green
                                    : Colors.white,
                                onChanged: (value) {
                                  context.read<MissionBloc>().add(
                                    MissionStepPressedEvent(
                                      missionId: widget.missionItem.missionId,
                                      value: value!,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Step ${index + 1}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isCompleted
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Submit button
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: mission.completedSteps == mission.totalSteps
                          ? () {
                              // final title = AppLocalizations.of(
                              //   context,
                              // )!.missionCompletedTitle(mission.missionTitle);

                              // final description = AppLocalizations.of(
                              //   context,
                              // )!.missionCompletedDescription;
                              context.read<MissionBloc>().add(
                                MissionSubmitButtonPressedEvent(
                                  notificationTitle: mission.missionTitle,
                                  notificationDescription:
                                      mission.missionDescription,
                                ),
                              );
                            }
                          : null,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
