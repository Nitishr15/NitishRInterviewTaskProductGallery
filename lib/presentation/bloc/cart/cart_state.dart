part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<Product> products;
  final Map<Product, int> productQuantities;

  CartLoaded({
    required this.products,
    required this.productQuantities,
  });

  @override
  List<Object> get props => [products, productQuantities];

  double get subtotalPrice => products.fold(0,
      (total, current) => total + current.price * productQuantities[current]!);

  double get tax => subtotalPrice * 0.18; // Assuming 18% tax rate
  double get convenienceFee =>
      subtotalPrice * 0.05; // Assuming 5% convenience fee

  double get totalPrice => subtotalPrice + tax + convenienceFee;
}
