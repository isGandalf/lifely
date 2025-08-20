import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';
import 'package:lifely/features/dashboard/domain/usecases/mission_dashboard_usecases.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final MissionDashboardUsecases missionDashboardUsecases;
  DashboardBloc(this.missionDashboardUsecases) : super(DashboardInitial()) {
    on<DashboardDataFetchEvent>(dashboardDataFetchEvent);
    on<DashboardDataClassChangeEvent>(dashboardDataClassChangeEvent);
  }

  FutureOr<void> dashboardDataFetchEvent(
    DashboardDataFetchEvent event,
    Emitter<DashboardState> emit,
  ) {
    try {
      emit(DashboardLoadingState());
      final dashboardData = missionDashboardUsecases.getClassMissions();

      emit(
        DashboardDataFetchSuccessState(
          dashboardData: dashboardData,
          selectedClass: dashboardData.first.className,
        ),
      );
    } on Exception catch (e) {
      emit(DashboardDataErrorState(error: 'Error from bloc --> $e'));
    } catch (e) {
      emit(DashboardDataErrorState(error: 'Unexpected error from bloc --> $e'));
    }
  }

  FutureOr<void> dashboardDataClassChangeEvent(
    DashboardDataClassChangeEvent event,
    Emitter<DashboardState> emit,
  ) {
    final currentState = state;
    if (currentState is DashboardDataFetchSuccessState) {
      emit(currentState.copyWith(selectedClass: event.classname));
    }
  }
}
