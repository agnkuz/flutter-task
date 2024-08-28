import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/models/get_products_page.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/repositories/products_repository.dart';

sealed class HomeState {
  const HomeState();
}

class Loading extends HomeState {
  const Loading();
}

class Loaded extends HomeState {
  const Loaded({
    required this.pages,
    this.productToScrollTo,
  });

  final List<ProductsPage> pages;
  final Product? productToScrollTo;
}

class Error extends HomeState {
  const Error({required this.error});

  final dynamic error;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._productsRepository) : super(const Loading());

  final ProductsRepository _productsRepository;

  final List<ProductsPage> _pages = [];
  var _param = GetProductsPage(pageNumber: 1);

  Future<void> getNextPage({String? productId}) async {
    try {
      final totalPages = _pages.lastOrNull?.totalPages;

      if (totalPages != null && _param.pageNumber > totalPages) {
        if (productId != null) {
          _pages.removeRange(1, _pages.length);
          _emitLoaded();
        }
        return;
      }

      final newPage = await _productsRepository.getProductsPage(_param);
      _param = _param.increasePageNumber();
      _pages.add(newPage);

      if (productId != null) {
        try {
          final productToScroll = newPage.products.firstWhere((product) => product.id == productId);
          _emitLoaded(productToScrollTo: productToScroll);
        } catch (_) {
          getNextPage(productId: productId);
        }
      } else {
        _emitLoaded();
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _emitLoaded({Product? productToScrollTo}) {
    emit(Loaded(pages: _pages, productToScrollTo: productToScrollTo));
  }
}
