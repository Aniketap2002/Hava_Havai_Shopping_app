import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/models/cart_item.dart';
import 'package:shopping_app/data/models/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final existingItem = state.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );
    if (state.contains(existingItem)) {
      existingItem.quantity++;
      state = [...state];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void updateQuantity(int productId, int quantity) {
    state =
        state
            .map((item) {
              if (item.product.id == productId) {
                item.quantity = quantity;
              }
              return item;
            })
            .where((item) => item.quantity > 0)
            .toList();
  }

  double get totalPrice => state.fold(
    0,
    (sum, item) => sum + (item.product.discountedPrice * item.quantity),
  );
}
