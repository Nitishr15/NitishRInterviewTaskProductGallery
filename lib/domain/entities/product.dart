import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.quantity = 1,
  });

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    double? price,
    String? description,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, price, description, quantity];
}
