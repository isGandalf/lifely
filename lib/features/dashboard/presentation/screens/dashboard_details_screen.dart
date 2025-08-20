import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:lifely/features/dashboard/presentation/widgets/bar_chart_view.dart';
import 'package:lifely/features/dashboard/presentation/widgets/dashboard_item_dropdown.dart';
import 'package:lifely/features/dashboard/presentation/widgets/total_mission_completed_count_container.dart';

class DashboardDetailsScreen extends StatefulWidget {
  const DashboardDetailsScreen({super.key});

  @override
  State<DashboardDetailsScreen> createState() => _DashboardDetailsScreenState();
}

class _DashboardDetailsScreenState extends State<DashboardDetailsScreen> {
  //String selectedClass = 'Class I';

  @override
  void initState() {
    context.read<DashboardBloc>().add(DashboardDataFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.scaffoldBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              print(state.runtimeType);
              if (state is DashboardLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DashboardDataErrorState) {
                final error = state.error;
                return Center(child: Text(error));
              } else if (state is DashboardDataFetchSuccessState) {
                // Get all data
                final dashboardData = state.dashboardData;

                // get the class names from dashboardData
                final classNames = dashboardData
                    .map((e) => e.className)
                    .toList();

                // set the default selected class on load
                final selectedClass = state.selectedClass;

                // set the selectedData
                final selectedData = dashboardData.firstWhere(
                  (c) => c.className == state.selectedClass,
                  orElse: () => dashboardData.first,
                );

                // count the total missions of the selected class
                final totalMissionsCompleted = selectedData.weeklyMissions
                    .fold<int>(0, (sum, e) => e.completed + sum);

                return Column(
                  children: [
                    // Row to show text 'showing data for:' and dropdown of classes
                    Row(
                      children: [
                        const Text(
                          'Showing data for:',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 20),
                        DashboardItemDropDown(selectedClass: selectedClass, classNames: classNames),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Total missions container
                    TotalMissionCompletedCountContainer(selectedClass: selectedClass, totalMissionsCompleted: totalMissionsCompleted),
                    const SizedBox(height: 20),
                    // Bar chart
                    BarChartView(selectedData: selectedData),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}



