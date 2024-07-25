import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded(products: [], productQuantities: {})) {
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateProductQuantity>(_onUpdateProductQuantity);
  }

  void _onAddProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    print(
        'Adding product to cart in bloc: ${event.product.name}, Quantity: ${event.quantity}');
    if (state is CartLoaded) {
      final stateLoaded = state as CartLoaded;
      final updatedProducts = List<Product>.from(stateLoaded.products);
      final updatedProductQuantities =
          Map<Product, int>.from(stateLoaded.productQuantities);

      if (updatedProductQuantities.containsKey(event.product)) {
        updatedProductQuantities[event.product] =
            updatedProductQuantities[event.product]! + event.quantity;
      } else {
        updatedProducts.add(event.product);
        updatedProductQuantities[event.product] = event.quantity;
      }

      emit(CartLoaded(
          products: updatedProducts,
          productQuantities: updatedProductQuantities));
    } else {
      final Map<Product, int> initialQuantities = {
        event.product: event.quantity
      };
      emit(CartLoaded(
          products: [event.product], productQuantities: initialQuantities));
    }
  }

  void _onRemoveProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final stateLoaded = state as CartLoaded;
      final updatedProducts = List<Product>.from(stateLoaded.products);
      final updatedProductQuantities =
          Map<Product, int>.from(stateLoaded.productQuantities);

      updatedProducts.remove(event.product);
      updatedProductQuantities.remove(event.product);

      emit(CartLoaded(
          products: updatedProducts,
          productQuantities: updatedProductQuantities));
    }
  }

  void _onUpdateProductQuantity(
      UpdateProductQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final stateLoaded = state as CartLoaded;
      final updatedProductQuantities =
          Map<Product, int>.from(stateLoaded.productQuantities);

      if (event.quantity > 0) {
        updatedProductQuantities[event.product] = event.quantity;
      } else {
        updatedProductQuantities.remove(event.product);
      }

      emit(CartLoaded(
          products: updatedProductQuantities.keys.toList(),
          productQuantities: updatedProductQuantities));
    }
  }
}
