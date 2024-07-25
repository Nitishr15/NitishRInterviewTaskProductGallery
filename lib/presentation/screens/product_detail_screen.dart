import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/presentation/screens/cart_screen.dart';
import '../bloc/cart/cart_bloc.dart';
import '../../domain/entities/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'en_IN', name: 'INR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      int itemCount = 0;
                      if (state is CartLoaded) {
                        itemCount = state.products.length;
                      }
                      return Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()),
                              );
                            },
                          ),
                          if (itemCount > 0)
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '$itemCount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            // Product image
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(widget.product.imageUrl),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          // Product name
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Quantity selector
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Description'),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text(quantity.toString()),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity < 10) quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          // Product description
                          Text(widget.product.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(AddProductToCart(widget.product, quantity));
                      // Navigator.pop(
                      //     context); // Go back to the product list after adding to cart
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
                    formatCurrency.format(widget.product.price),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
