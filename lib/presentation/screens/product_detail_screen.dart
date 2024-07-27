import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/product_image.dart';
import '../widgets/top_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductTopBar(),
            Expanded(
              child: ProductImageSection(
                product: widget.product,
                quantity: quantity,
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                  });
                },
              ),
            ),
            BottomBar(
              product: widget.product,
              quantity: quantity,
            ),
          ],
        ),
      ),
    );
  }
}
