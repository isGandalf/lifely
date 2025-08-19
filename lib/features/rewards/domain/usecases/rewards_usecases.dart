import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/rewards_errors.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';
import 'package:lifely/features/rewards/domain/repository/rewards_repository.dart';

class RewardsUsecases {
  final RewardsRepository rewardsRepository;

  RewardsUsecases({required this.rewardsRepository});

  Either<RewardsErrors, Rewards> fetchRewards() {
    final results = rewardsRepository.fetchRewards();
    return results.fold(
      ifLeft: (failure) => Left(RewardsFetchError(message: failure.message)),
      ifRight: (rewards) => Right(rewards),
    );
  }

  Future<Either<RewardsErrors, void>> resetRewards(int coins) async {
    final results = await rewardsRepository.resetRewards(coins);
    return results.fold(
      ifLeft: (failure) => Left(RewardsResetError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  Future<Either<RewardsErrors, void>> updateRewards(int coins) async {
    final results = await rewardsRepository.updateRewards(coins);
    return results.fold(
      ifLeft: (failure) => Left(RewardsUpdateError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }
}
