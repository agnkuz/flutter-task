import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/constants.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/models/get_products_page.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';
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
    required this.selectedFilters,
  });

  final List<ProductsPage> pages;
  final Product? productToScrollTo;
  final SelectedFilters selectedFilters;
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
  SelectedFilters _selectedFilters = const SelectedFilters(
    tags: <String>[],
    categories: <CategoryEnum>[],
  );

  Future<void> getNextPage({
    String? productId,
    SelectedFilters? selectedFilters,
  }) async {
    try {
      final totalPages = _pages.lastOrNull?.totalPages;

      if (totalPages != null && _param.pageNumber > totalPages) {
        if (productId != null) {
          _pages.removeRange(1, _pages.length);
          _emitLoaded(selectedFilters: selectedFilters);
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
            selectedFilters: selectedFilters,
          );
        } catch (_) {
          getNextPage(productId: productId);
        }
      } else {
        _emitLoaded(selectedFilters: selectedFilters);
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void handleCategoryCheckbox(CategoryEnum category) {
    List<CategoryEnum> updatedCategoriesList = [];
    if (_selectedFilters.categories.contains(category)) {
      updatedCategoriesList = _selectedFilters.categories.toList()..remove(category);
    } else {
      updatedCategoriesList = _selectedFilters.categories.toList()..add(category);
    }
    _selectedFilters = _selectedFilters.copyWith(categories: updatedCategoriesList);
    applyFilters();
  }

  void handleTagCheckbox(String tag) {
    List<String> updatedTagsList = [];
    if (_selectedFilters.tags.contains(tag)) {
      updatedTagsList = _selectedFilters.tags.toList()..remove(tag);
    } else {
      updatedTagsList = _selectedFilters.tags.toList()..add(tag);
    }
    _selectedFilters = _selectedFilters.copyWith(tags: updatedTagsList);
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
          shouldAdd = shouldAdd &&
              _selectedFilters.categories.any((chosenCategory) =>
                  chosenCategory.keyWords.any((keyword) => product.name.toLowerCase().contains(keyword.toLowerCase())));
        }

        // Tag filter
        if (_selectedFilters.tags.isNotEmpty) {
          shouldAdd = shouldAdd && product.tags.any((tag) => _selectedFilters.tags.contains(tag.tag));
        }

        if (shouldAdd && !filteredProducts.contains(product)) {
          filteredProducts.add(product);
        }
      }

      // final filteredProducts = <Product>[];

      // for (final product in page.products) {
      //   // filter by category
      //   if (_selectedFilters.categories.isNotEmpty) {
      //     for (final chosenCategory in _selectedFilters.categories) {
      //       for (final keyword in chosenCategory.keyWords) {
      //         if (product.name.toLowerCase().contains(keyword.toLowerCase()) && !filteredProducts.contains(product)) {
      //           filteredProducts.add(product);
      //         }
      //       }
      //     }
      //   }

      //   // filter by tag
      //   if (_selectedFilters.tags.isNotEmpty) {
      //     for (final tag in _selectedFilters.tags) {
      //       if (product.tags.any((element) => element.tag == tag) && !filteredProducts.contains(product)) {
      //         filteredProducts.add(product);
      //       }
      //     }
      //   }
      // }

      filteredPages.add(page.copyWith(products: filteredProducts));
      _emitFilteredPages(filteredPages);
    }

    // else {
    //   // no filters selected, return all pages
    //   filteredPages.addAll(_pages);
    //   _emitFilteredPages(filteredPages);
    // }
  }

  void _emitFilteredPages(List<ProductsPage> filteredPages) => emit(
        Loaded(pages: filteredPages, selectedFilters: _selectedFilters),
      );

  void clearFilters() {
    _selectedFilters = _selectedFilters.copyWith(
      categories: [],
      tags: [],
      minPrice: minPriceValue,
      maxPrice: maxPriceValue,
    );
    emit(Loaded(pages: _pages, selectedFilters: _selectedFilters));
  }

  void _emitLoaded({Product? productToScrollTo, SelectedFilters? selectedFilters}) {
    emit(
      Loaded(
        pages: _pages,
        productToScrollTo: productToScrollTo,
        selectedFilters: _selectedFilters,
      ),
    );
  }
}
