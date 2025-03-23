import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/providers/cart_provider.dart';
import 'package:shopping_app/presentation/widgets/cart_item_card.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalPrice = ref.watch(cartProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body:
          cartItems.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemCard(cartItem: cartItems[index]);
                },
              ),
      bottomSheet:
          cartItems.isEmpty
              ? null
              : Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('AMOUNT PRICE'),
                        Text(
                          '₹${totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button background
                        foregroundColor:
                            Colors.white, // Default text/icon color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ), // Adjusted padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(
                          120,
                          48,
                        ), // Slightly wider to fit the avatar
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('CHECK OUT'),
                          const SizedBox(
                            width: 8,
                          ), // Space between text and avatar
                          if (cartItems.isNotEmpty)
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white, // White background
                              child: Text(
                                cartItems.length.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red, // Red text
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
