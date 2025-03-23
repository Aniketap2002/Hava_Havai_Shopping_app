import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/models/product.dart';
import 'package:shopping_app/domain/services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final productProvider = FutureProvider.family<List<Product>, int>((
  ref,
  page,
) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchProducts(page: page);
});
