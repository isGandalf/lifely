import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/rewards/data/model/rewards_model.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';
import 'package:lifely/features/rewards/domain/usecases/rewards_usecases.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';
import 'package:lifely/features/teacher_view/presentation/bloc/products_bloc.dart';
import 'package:meta/meta.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final RewardsUsecases rewardsUsecases;
  RewardsBloc(this.rewardsUsecases) : super(RewardsInitial()) {
    on<FetchRewardsEvent>(fetchRewardsEvent);
    on<UpdateRewardsEvent>(updateRewardsEvent);
    on<ResetRewardsEvent>(resetRewardsEvent);
  }

  void fetchRewardsEvent(FetchRewardsEvent event, Emitter<RewardsState> emit) {
    final result = rewardsUsecases.fetchRewards();
    result.fold(
      ifLeft: (failure) => emit(RewardsErrors(message: failure.message)),
      ifRight: (rewards) {
        emit(RewardsLoadedState(rewards: rewards));
      },
    );
  }

  FutureOr<void> updateRewardsEvent(
    UpdateRewardsEvent event,
    Emitter<RewardsState> emit,
  ) async {
    final result = await rewardsUsecases.updateRewards(event.coins);
    print('update rewards bloc -------------------------');
    result.fold(
      ifLeft: (failure) => emit(RewardsErrors(message: failure.message)),
      ifRight: (_) {
        emit(UpdateRewardsSuccess());
        add(FetchRewardsEvent());
      },
    );
  }

  FutureOr<void> resetRewardsEvent(
    ResetRewardsEvent event,
    Emitter<RewardsState> emit,
  ) async {
    final result = await rewardsUsecases.resetRewards(event.coins);
    result.fold(
      ifLeft: (failure) => emit(RewardsErrors(message: failure.message)),
      ifRight: (_) {
        emit(ResetRewardsSuccess());
        add(FetchRewardsEvent());
      },
    );
  }
}
