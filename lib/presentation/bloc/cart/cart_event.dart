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

  AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final Product product;

  RemoveProductFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class ClearCart extends CartEvent {}

class UpdateProductQuantity extends CartEvent {
  final Product product;
  final int quantity;

  UpdateProductQuantity(this.product, this.quantity);

  @override
  List<Object> get props => [product, quantity];
}
