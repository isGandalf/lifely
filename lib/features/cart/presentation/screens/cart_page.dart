import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lifely/features/cart/presentation/screens/checkout.dart';
import 'package:lifely/features/rewards/domain/entity/rewards.dart';
import 'package:lifely/features/rewards/presentation/bloc/rewards_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.scaffoldBackground,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Clear Cart'),
                    content: const Text(
                      'Are you sure you want to clear the cart?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // clear the cart
                          context.read<CartBloc>().add(CartClearEvent());

                          // Also, add the total coins in the cart back to rewards
                          final currentCartState = context
                              .read<CartBloc>()
                              .state;
                          if (currentCartState is CartLoadedState) {
                            final totalCoins = currentCartState.cartItems
                                .fold<int>(
                                  0,
                                  (sum, item) => sum + item.productPrice,
                                );
                            context.read<RewardsBloc>().add(
                              ProductItemRemovedFromCartButtonPressedEvent(
                                coins: totalCoins,
                              ),
                            );
                          }

                          // pop the alert box
                          Navigator.of(context).pop();
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Clear all',
                  style: TextStyle(
                    color: AppColors.primaryAppColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  print(state.runtimeType);
                  if (state is CartLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartLoadedState) {
                    final cartItems = state.cartItems;

                    if (cartItems.isEmpty) {
                      return const Center(
                        child: Text(
                          'No items in cart',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = state.cartItems[index];
                        return Container(
                          height: 80,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // product image, price and name
                              Row(
                                children: [
                                  Image.asset(
                                    cartItem.imageUrl,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productName,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${cartItem.productPrice} coins',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // delete cart item
                              IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                    CartDeleteEvent(
                                      productId: cartItem.productId,
                                    ),
                                  );
                                  context.read<RewardsBloc>().add(
                                    ProductItemRemovedFromCartButtonPressedEvent(
                                      coins: cartItem.productPrice,
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.cancel),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is CartErrorState) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('No items in cart'));
                },
              ),
            ),
            const SizedBox(height: 20),

            // Total coins and checkout button
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoadedState) {
                  final totalCoins = state.cartItems.fold<int>(
                    0,
                    (sum, item) => sum + item.productPrice,
                  );

                  return totalCoins > 0
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutSuccessScreen(
                                  coinsSpent: totalCoins,
                                ),
                              ),
                            );

                            context.read<CartBloc>().add(CartClearEvent());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Total:',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      ' $totalCoins coins',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Text(
                                  'Checkout >',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
