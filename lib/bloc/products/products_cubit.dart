import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/repositories/product_repository.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(ProductInitial());
  Future<void> getAllProducts() async {
    emit(ProductLoading());
    List<ProductId> allData = await _productRepository.getAllProducts();
    emit(ProductsLoaded(products: allData));
  }
}
