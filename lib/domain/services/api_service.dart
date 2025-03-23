import 'package:dio/dio.dart';
import 'package:shopping_app/data/models/product.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts({int page = 0, int limit = 10}) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'skip': page * limit, 'limit': limit},
      );
      final data = response.data['products'] as List;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
