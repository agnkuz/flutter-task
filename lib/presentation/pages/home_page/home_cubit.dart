import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/constants.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/models/get_products_page.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_state.dart';
import 'package:flutter_recruitment_task/repositories/products_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._productsRepository) : super(const Loading());

  final ProductsRepository _productsRepository;

  final List<ProductsPage> _pages = [];
  var _param = const GetProductsPage(pageNumber: 1);
  var _selectedFilters = SelectedFilters.empty();

  Future<void> getNextPage({
    String? productId,
    SelectedFilters? selectedFilters,
  }) async {
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

      if (selectedFilters != null) {
        applyFilters();
        return;
      }

      if (productId != null) {
        try {
          final productToScroll = newPage.products.firstWhere((product) => product.id == productId);
          _emitLoaded(
            productToScrollTo: productToScroll,
          );
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

  void handleCategoryCheckbox(CategoryEnum category) {
    _selectedFilters = _selectedFilters.copyWith(
      categories: _selectedFilters.categories.contains(category)
          ? (_selectedFilters.categories.toList()..remove(category))
          : (_selectedFilters.categories.toList()..add(category)),
    );
    applyFilters();
  }

  void handleTagCheckbox(String tag) {
    _selectedFilters = _selectedFilters.copyWith(
      tags: _selectedFilters.tags.contains(tag)
          ? (_selectedFilters.tags.toList()..remove(tag))
          : (_selectedFilters.tags.toList()..add(tag)),
    );
    applyFilters();
  }

  void handlePriceSliderChange(double minValue, double maxValue) {
    _selectedFilters = _selectedFilters.copyWith(
      minPrice: minValue,
      maxPrice: maxValue,
    );
    applyFilters();
  }

  void applyFilters() {
    final filteredPages = <ProductsPage>[];

    for (final page in _pages) {
      final filteredProducts = <Product>[];
      for (final product in page.products) {
        bool shouldAdd = true;

        // Category filter
        if (_selectedFilters.categories.isNotEmpty) {
          shouldAdd = _selectedFilters.categories.any((chosenCategory) =>
              chosenCategory.keyWords.any((keyword) => product.name.toLowerCase().contains(keyword.toLowerCase())));
        }

        // Tag filter
        if (_selectedFilters.tags.isNotEmpty) {
          shouldAdd = shouldAdd && product.tags.any((tag) => _selectedFilters.tags.contains(tag.tag));
        }

        // Price filter
        final price = product.offer.regularPrice.amount;
        shouldAdd = shouldAdd && price >= _selectedFilters.minPrice && price <= _selectedFilters.maxPrice;

        if (shouldAdd && !filteredProducts.contains(product)) {
          filteredProducts.add(product);
        }
      }

      filteredPages.add(page.copyWith(products: filteredProducts));
      emit(
        Loaded(pages: filteredPages, selectedFilters: _selectedFilters),
      );
    }
  }

  void clearFilters() {
    _selectedFilters = _selectedFilters.copyWith(
      categories: [],
      tags: [],
      minPrice: minPriceValue,
      maxPrice: maxPriceValue,
    );
    emit(Loaded(pages: _pages, selectedFilters: _selectedFilters));
  }

  void _emitLoaded({Product? productToScrollTo}) {
    emit(
      Loaded(
        pages: _pages,
        productToScrollTo: productToScrollTo,
        selectedFilters: _selectedFilters,
      ),
    );
  }
}
