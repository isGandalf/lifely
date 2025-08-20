import 'package:flutter/material.dart';
import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';
import 'package:lifely/features/dashboard/domain/entity/weekly_mission.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartView extends StatelessWidget {
  const BarChartView({super.key, required this.selectedData});

  final ClassMissions selectedData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withAlpha(80)),
        ],
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          minimum: 0,
          maximum: 15,
          interval: 3,
          majorGridLines: MajorGridLines(width: 0),
        ),
        title: const ChartTitle(
          text: 'Learning Gain',
          textStyle: TextStyle(fontWeight: FontWeight.w700),
        ),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ColumnSeries<WeeklyMission, String>>[
          ColumnSeries<WeeklyMission, String>(
            name: 'Missions completed',
            dataSource: selectedData.weeklyMissions,
            xValueMapper: (WeeklyMission stat, _) => stat.week,
            yValueMapper: (WeeklyMission stat, _) => stat.completed,
            animationDuration: 500,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }
}
