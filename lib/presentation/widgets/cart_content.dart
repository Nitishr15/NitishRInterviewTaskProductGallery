import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/product.dart';

class CartContent extends StatelessWidget {
  final List<Product> products;
  final Function(Product product) onRemoveProduct;
  final Function(Product product, int quantity) onUpdateQuantity;

  const CartContent({
    Key? key,
    required this.products,
    required this.onRemoveProduct,
    required this.onUpdateQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'en_IN', name: 'INR');

    if (products.isEmpty) {
      return Center(child: Text('Your cart is empty'));
    } else {
      double total = products.fold(
          0, (sum, product) => sum + (product.price * product.quantity));

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      product.imageUrl,
                    ),
                    title: Text(
                      product.name,
                    ),
                    subtitle: Text(
                      formatCurrency.format(product.price),
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: product.quantity > 1
                              ? () => onUpdateQuantity(
                                  product, product.quantity - 1)
                              : null,
                        ),
                        Text('${product.quantity}',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: product.quantity < 10
                              ? () => onUpdateQuantity(
                                  product, product.quantity + 1)
                              : null,
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () => onRemoveProduct(product),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                    'Total (${products.length} items): ${formatCurrency.format(total)} ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Implement checkout functionality
                  },
                  child: Center(
                    child: Text(
                      'Proceed to checkout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
