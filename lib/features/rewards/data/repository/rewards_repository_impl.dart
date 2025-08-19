// ignore: implementation_imports
import 'package:dart_either/src/dart_either.dart';
import 'package:lifely/core/errors/rewards_errors.dart';
import 'package:lifely/features/rewards/data/source/rewards_source.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';
import 'package:lifely/features/rewards/domain/repository/rewards_repository.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  final RewardsSource rewardsSource;

  RewardsRepositoryImpl({required this.rewardsSource});

  @override
  Either<RewardsErrors, Rewards> fetchRewards() {
    final result = rewardsSource.fetchRewards();
    return result.fold(
      ifLeft: (failure) => Left(RewardsFetchError(message: failure.message)),
      ifRight: (rewards) => Right(rewards.toEntity()),
    );
  }

  @override
  Future<Either<RewardsErrors, void>> resetRewards(int coins) async {
    final result = await rewardsSource.resetRewards(coins);
    return result.fold(
      ifLeft: (failure) => Left(RewardsResetError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  @override
  Future<Either<RewardsErrors, void>> updateRewards(int coins) async {
    final result = await rewardsSource.updateRewards(coins);
    return result.fold(
      ifLeft: (failure) => Left(RewardsUpdateError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }
}
