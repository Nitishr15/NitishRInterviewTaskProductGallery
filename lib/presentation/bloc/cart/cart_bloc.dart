import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'cart_event.dart';
import '../../../domain/entities/product.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>((event, emit) => _mapLoadCartToState(emit));
    on<AddProductToCart>(
        (event, emit) => _mapAddProductToCartToState(event, emit));
    on<RemoveProductFromCart>(
        (event, emit) => _mapRemoveProductFromCartToState(event, emit));
    on<ClearCart>((event, emit) => _mapClearCartToState(emit));
    on<UpdateProductQuantity>(
        (event, emit) => _mapUpdateProductQuantityToState(event, emit));
  }

  void _mapLoadCartToState(Emitter<CartState> emit) {
    emit(CartLoaded(products: []));
  }

  void _mapAddProductToCartToState(
      AddProductToCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final List<Product> updatedProducts =
          List.from((state as CartLoaded).products);
      final index = updatedProducts
          .indexWhere((product) => product.id == event.product.id);

      if (index != -1) {
        final existingProduct = updatedProducts[index];
        updatedProducts[index] = existingProduct.copyWith(
            quantity: existingProduct.quantity + event.product.quantity);
      } else {
        updatedProducts.add(event.product);
      }

      emit(CartLoaded(products: updatedProducts));
    }
  }

  void _mapRemoveProductFromCartToState(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final updatedProducts = (state as CartLoaded)
          .products
          .where((product) => product.id != event.product.id)
          .toList();
      emit(CartLoaded(products: updatedProducts));
    }
  }

  void _mapClearCartToState(Emitter<CartState> emit) {
    emit(CartLoaded(products: []));
  }

  void _mapUpdateProductQuantityToState(
      UpdateProductQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final List<Product> updatedProducts =
          List.from((state as CartLoaded).products);
      final index = updatedProducts
          .indexWhere((product) => product.id == event.product.id);

      if (index != -1) {
        final updatedProduct =
            updatedProducts[index].copyWith(quantity: event.quantity);
        updatedProducts[index] = updatedProduct;
      }

      emit(CartLoaded(products: updatedProducts));
    }
  }
}
