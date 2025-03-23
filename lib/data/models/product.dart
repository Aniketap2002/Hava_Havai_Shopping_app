class Product {
  final int id;
  final String title;
  final double price;
  final double discountPercentage;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  double get discountedPrice => price * (1 - discountPercentage / 100);
}
