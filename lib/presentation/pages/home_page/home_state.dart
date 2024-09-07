import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';

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
