import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lifely/features/rewards/presentation/bloc/rewards_bloc.dart';
import 'package:lifely/features/teacher_view/presentation/bloc/products_bloc.dart';

class ShopItemListView extends StatelessWidget {
  const ShopItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        print(state.runtimeType);
        if (state is ProductsLoadedState) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),

              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final productItem = state.products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Image.asset(
                            productItem.imageUrl,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        productItem.productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: BlocBuilder<RewardsBloc, RewardsState>(
                          builder: (context, state) {
                            if (state is RewardsLoadedState) {
                              final rewardsBalance = state.rewards.rewardCoins;

                              return ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      rewardsBalance >= productItem.productPrice
                                      ? const WidgetStatePropertyAll(
                                          Colors.green,
                                        )
                                      : const WidgetStatePropertyAll(
                                          Colors.grey,
                                        ),
                                ),
                                onPressed:
                                    rewardsBalance >= productItem.productPrice
                                    ? () {
                                        context.read<CartBloc>().add(
                                          CartAddEvent(products: productItem),
                                        );
                                        context.read<RewardsBloc>().add(
                                          UpdateRewardsEvent(
                                            coins: productItem.productPrice,
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${productItem.productName} added to cart',
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                          ),
                                        );
                                      }
                                    : null,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    const SizedBox(width: 5),
                                    Text(productItem.productPrice.toString()),
                                  ],
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No products available'));
        }
      },
    );
  }
}
