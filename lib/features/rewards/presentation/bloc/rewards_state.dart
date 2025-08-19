part of 'rewards_bloc.dart';

@immutable
sealed class RewardsState {}

final class RewardsInitial extends RewardsState {}

// non action states
final class RewardsNonActionState extends RewardsState {}

final class RewardsLoadingState extends RewardsNonActionState {}

final class RewardsLoadedState extends RewardsNonActionState {
  final Rewards rewards;

  RewardsLoadedState({required this.rewards});
}

final class RewardsErrors extends RewardsNonActionState {
  final String message;

  RewardsErrors({required this.message});
}

// action states
final class RewardsActionState extends RewardsState {}

final class ResetRewardsSuccess extends RewardsActionState {}

final class ResetRewardsFailure extends RewardsActionState {
  final String message;

  ResetRewardsFailure({required this.message});
}

final class UpdateRewardsSuccess extends RewardsActionState {}

final class UpdateRewardsFailure extends RewardsActionState {
  final String message;

  UpdateRewardsFailure({required this.message});
}
