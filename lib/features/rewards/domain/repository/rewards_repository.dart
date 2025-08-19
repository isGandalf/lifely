import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/rewards_errors.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';

abstract class RewardsRepository {
  Either<RewardsErrors, Rewards> fetchRewards();
  Future<Either<RewardsErrors, void>> resetRewards(int coins);
  Future<Either<RewardsErrors, void>> updateRewards(int coins);
}
