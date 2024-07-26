import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../widgets/cart_content.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return CartContent(
              products: state.products,
              onRemoveProduct: (product) {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveProductFromCart(product));
              },
              onUpdateQuantity: (product, quantity) {
                BlocProvider.of<CartBloc>(context)
                    .add(UpdateProductQuantity(product, quantity));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
