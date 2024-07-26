import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddProductToCart extends CartEvent {
  final Product product;

  const AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
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
