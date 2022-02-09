import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];
  static List<Product> products = [
    Product(
        name: 'soft drink #1',
        category: 'soft drink',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
        price: 299.0,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'soft drink #2',
        category: 'hard drink',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
        price: 299.0,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'soft drink #3',
        category: 'medium drink',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
        price: 299.0,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'soft drink #4',
        category: 'soft drink',
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
        price: 299.0,
        isRecommended: false,
        isPopular: true),
  ];
}
