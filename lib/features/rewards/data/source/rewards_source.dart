import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/rewards_errors.dart';
import 'package:lifely/features/rewards/data/model/rewards_model.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardsSource {
  final SharedPreferences prefs;
  static const String _rewardsKey = 'reward_coins';

  RewardsSource({required this.prefs});

  Either<RewardsErrors, RewardsModel> fetchRewards() {
    try {
      final coins = prefs.getInt(_rewardsKey);

      if (coins == null) {
        // initialize default
        prefs.setInt(_rewardsKey, 1500);
      }

      return Right(RewardsModel.fromPrefs(coins));
    } on Exception catch (e) {
      return Left(RewardsFetchError(message: 'Failed to fetch rewards: $e'));
    } catch (e) {
      return Left(
        RewardsFetchError(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  Future<Either<RewardsErrors, void>> resetRewards(int coins) async {
    try {
      await prefs.setInt(_rewardsKey, coins);
      return const Right(null);
    } on Exception catch (e) {
      return Left(RewardsResetError(message: 'Failed to update rewards: $e'));
    } catch (e) {
      return Left(
        RewardsResetError(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  Future<Either<RewardsErrors, void>> updateRewards(int coins) async {
    try {
      final currentCoins = prefs.getInt(_rewardsKey) ?? 1500;
      await prefs.setInt(_rewardsKey, currentCoins - coins);
      return const Right(null);
    } on Exception catch (e) {
      return Left(RewardsUpdateError(message: 'Failed to update rewards: $e'));
    } catch (e) {
      return Left(
        RewardsUpdateError(message: 'An unexpected error occurred: $e'),
      );
    }
  }
}
