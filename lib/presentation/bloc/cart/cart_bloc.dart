import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'cart_event.dart';
import '../../../domain/entities/product.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded(products: [])) {
    on<LoadCart>(_onLoadCart);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateProductQuantity>(_onUpdateProductQuantity);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    // Load initial cart state (e.g., from local storage or an API)
    emit(CartLoaded(products: []));
  }

  void _onAddProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    print('Current State: $state');
    if (state is CartLoaded) {
      final cart = (state as CartLoaded).products;
      final existingProductIndex =
          cart.indexWhere((product) => product.id == event.product.id);
      if (existingProductIndex != -1) {
        final updatedCart = List<Product>.from(cart);
        final existingProduct = updatedCart[existingProductIndex];
        final updatedProduct =
            existingProduct.copyWith(quantity: existingProduct.quantity + 1);
        updatedCart[existingProductIndex] = updatedProduct;
        emit(CartLoaded(products: updatedCart));
      } else {
        final updatedCart = List<Product>.from(cart)
          ..add(event.product.copyWith(quantity: 1));
        emit(CartLoaded(products: updatedCart));
      }
    } else {
      print('error');
    }
  }

  void _onRemoveProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final cart = (state as CartLoaded).products;
      final updatedCart = List<Product>.from(cart)
        ..removeWhere((product) => product.id == event.product.id);
      emit(CartLoaded(products: updatedCart));
    }
  }

  void _onUpdateProductQuantity(
      UpdateProductQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final cart = (state as CartLoaded).products;
      final productIndex =
          cart.indexWhere((product) => product.id == event.product.id);
      if (productIndex != -1) {
        final updatedProduct =
            cart[productIndex].copyWith(quantity: event.quantity);
        final updatedCart = List<Product>.from(cart)
          ..[productIndex] = updatedProduct;
        emit(CartLoaded(products: updatedCart));
      }
    }
  }
}
