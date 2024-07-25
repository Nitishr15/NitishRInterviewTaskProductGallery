import 'package:product_cart_app/domain/entities/product.dart';
import 'package:product_cart_app/domain/repositories/product_repository.dart';
import '../sources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
