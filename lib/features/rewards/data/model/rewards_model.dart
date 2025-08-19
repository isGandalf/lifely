import 'package:lifely/features/rewards/domain/entity/rewards.dart';

class RewardsModel {
  final int rewardCoins;

  RewardsModel({required this.rewardCoins});

  factory RewardsModel.fromPrefs(int? value) {
    return RewardsModel(rewardCoins: value ?? 1500);
  }

  Rewards toEntity() {
    return Rewards(rewardCoins: rewardCoins);
  }
}
