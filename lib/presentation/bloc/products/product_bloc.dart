import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductLoading()) {
    on<FetchProducts>(_onFetchProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await getProducts();
      emit(ProductLoaded(products: products, allProducts: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final allProducts = (state as ProductLoaded).allProducts;
      final filteredProducts = allProducts.where((product) {
        return product.name.toLowerCase().contains(event.query.toLowerCase());
      }).toList();
      emit(ProductLoaded(products: filteredProducts, allProducts: allProducts));
    }
  }
}
