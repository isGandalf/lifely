part of 'rewards_bloc.dart';

@immutable
sealed class RewardsEvent {}

final class FetchRewardsEvent extends RewardsEvent {}

final class ResetRewardsEvent extends RewardsEvent {
  final int coins;

  ResetRewardsEvent({required this.coins});
}

final class UpdateRewardsEvent extends RewardsEvent {
  final int coins;

  UpdateRewardsEvent({required this.coins});
}

final class ProductItemButtonPressedEvent extends RewardsEvent {
  final Products products;

  ProductItemButtonPressedEvent({required this.products});
}
