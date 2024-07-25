part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;
  final int quantity;

  const AddProductToCart(this.product, this.quantity);

  @override
  List<Object> get props => [product, quantity];
}

class RemoveProductFromCart extends CartEvent {
  final Product product;

  const RemoveProductFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProductQuantity extends CartEvent {
  final Product product;
  final int quantity;

  const UpdateProductQuantity(this.product, this.quantity);

  @override
  List<Object> get props => [product, quantity];
}
