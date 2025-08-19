abstract class RewardsErrors {
  String get message;

  @override
  String toString() {
    return message;
  }
}

class RewardsFetchError extends RewardsErrors {
  @override
  final String message;

  RewardsFetchError({required this.message});
}

class RewardsResetError extends RewardsErrors {
  @override
  final String message;

  RewardsResetError({required this.message});
}

class RewardsUpdateError extends RewardsErrors {
  @override
  final String message;

  RewardsUpdateError({required this.message});
}