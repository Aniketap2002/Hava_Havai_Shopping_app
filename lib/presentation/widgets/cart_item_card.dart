import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/models/cart_item.dart';
import 'package:shopping_app/data/providers/cart_provider.dart';

class CartItemCard extends ConsumerWidget {
  final CartItem cartItem;

  const CartItemCard({required this.cartItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = cartItem.product;
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                product.thumbnail,
                //height: 60,
                width: 100,
                fit:
                    BoxFit
                        .cover, // Ensures the image covers the available space
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              '₹${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '₹${product.discountedPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          ' ${product.discountPercentage}% OFF',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Add some spacing
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(
                          1,
                        ), // Uniform small padding
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Light grey background
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Slightly smaller rounded corners
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .updateQuantity(
                                      product.id,
                                      cartItem.quantity - 1,
                                    );
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 25,
                              ), // Smaller icon
                              padding: const EdgeInsets.all(
                                1,
                              ), // Minimal padding
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ), // Small constraints
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                              ), // Specific small padding
                              child: Text(
                                cartItem.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18, // Smaller text
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .updateQuantity(
                                      product.id,
                                      cartItem.quantity + 1,
                                    );
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 25,
                              ), // Smaller icon
                              padding: const EdgeInsets.all(
                                1,
                              ), // Minimal padding
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ), // Small constraints
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
