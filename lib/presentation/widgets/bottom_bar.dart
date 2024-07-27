import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/domain/entities/product.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import 'package:intl/intl.dart';

class BottomBar extends StatelessWidget {
  final Product product;
  final int quantity;

  const BottomBar({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              context
                  .read<CartBloc>()
                  .add(AddProductToCart(product.copyWith(quantity: quantity)));
            },
            child: Row(
              children: [
                Icon(Icons.add_shopping_cart),
                SizedBox(width: 8),
                Text('Add to cart'),
              ],
            ),
          ),
          Text(
            '${NumberFormat.simpleCurrency(locale: 'en_IN', name: 'INR').format(product.price * quantity)}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
