import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/rewards/presentation/bloc/rewards_bloc.dart';

class RewardsContainer extends StatelessWidget {
  const RewardsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsBloc, RewardsState>(
      builder: (context, state) {
        print(state.runtimeType);
        if (state is RewardsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RewardsErrors) {
          print(state.message);
          return Text(state.message, style: const TextStyle(color: Colors.red));
        } else if (state is RewardsLoadedState) {
          return GestureDetector(
            onTap: () {
              // alert box to reset rewards
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Reset Rewards'),
                    content: const Text(
                      'Are you sure you want to reset your rewards?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<RewardsBloc>(
                            context,
                          ).add(ResetRewardsEvent(coins: 1500));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryAppColor,
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(
                    state.rewards.rewardCoins.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryAppColor,
          ),
          child: const Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 5),
              Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
