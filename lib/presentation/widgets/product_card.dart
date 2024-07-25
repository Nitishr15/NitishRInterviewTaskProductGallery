import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:product_cart_app/presentation/screens/product_detail_screen.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'en_IN', name: 'INR');

    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.name),
        subtitle: Text(formatCurrency.format(product.price)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)),
          );
        },
      ),
    );
  }
}
