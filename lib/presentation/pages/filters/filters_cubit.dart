import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/models/get_products_page.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/repositories/products_repository.dart';

sealed class FiltersState {
  const FiltersState();
}

class FiltersLoading extends FiltersState {
  const FiltersLoading();
}

class FiltersLoaded extends FiltersState {
  const FiltersLoaded({
    required this.tagsFilter,
    required this.categoriesFilter,
  });

  final TagFilter tagsFilter;
  final List<CategoryEnum> categoriesFilter;
}

class FiltersError extends FiltersState {
  const FiltersError({required this.error});

  final dynamic error;
}

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit(this._productsRepository) : super(const FiltersLoading()) {
    loadFilters();
  }

  final ProductsRepository _productsRepository;

  TagFilter? _tagsFilter;

  Future<void> loadFilters() async {
    emit(const FiltersLoading());
    try {
      if (_tagsFilter != null) {
        _emitLoaded();
        return;
      }

      final products = <Product>[];
      final tags = <String>{};

      for (int i = 1; i <= 3; i++) {
        final page = await _productsRepository.getProductsPage(
          GetProductsPage(pageNumber: i),
        );
        products.addAll(page.products);
      }

      for (final product in products) {
        for (Tag tag in product.tags) {
          tags.add(tag.tag);
        }
      }

      _tagsFilter = TagFilter(names: tags);
      _emitLoaded();
    } catch (e) {
      emit(FiltersError(error: e));
    }
  }

  void _emitLoaded() {
    emit(
      FiltersLoaded(
        tagsFilter: _tagsFilter!,
        categoriesFilter: CategoryEnum.values,
      ),
    );
  }
}
