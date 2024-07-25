import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required String imageUrl,
    required double price,
    required String description,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          price: price,
          description: description,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      description: json['description'],
    );
  }
}
