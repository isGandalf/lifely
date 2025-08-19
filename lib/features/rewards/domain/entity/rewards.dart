class Rewards {
  final int rewardCoins;

  Rewards({required this.rewardCoins});

  Rewards copyWith({int? rewardCoins}) {
    return Rewards(rewardCoins: rewardCoins ?? this.rewardCoins);
  }
}
