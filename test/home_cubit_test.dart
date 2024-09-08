import 'dart:convert';

import 'package:flutter_recruitment_task/constants.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/models/get_products_page.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

main() {
  late MockProductsRepository mockProductsRepository;
  final emptyFilters = SelectedFilters.empty();
  late Product mockedProduct;
  late Product mockedProductBest;
  late final expectedPage = ProductsPage(
    pageNumber: 1,
    totalPages: 3,
    pageSize: 3,
    products: [
      mockedProduct,
      mockedProduct,
      mockedProduct,
    ],
  );

  late final unfilteredPage = ProductsPage(
    pageNumber: 1,
    totalPages: 3,
    pageSize: 3,
    products: [
      mockedProduct,
      mockedProductBest,
      mockedProduct,
    ],
  );

  late final filteredPage = ProductsPage(
    pageNumber: 1,
    totalPages: 3,
    pageSize: 3,
    products: [mockedProductBest],
  );

  setUp(() async {
    mockProductsRepository = MockProductsRepository();
    mockedProduct = Product.fromJson(jsonDecode(mockedProductJson));
    mockedProductBest = Product.fromJson(jsonDecode(mockedProductBestJson));
  });

  group(HomeCubit, () {
    test('initial state is Loading', () {
      final cubit = HomeCubit(mockProductsRepository);
      expect(cubit.state, equals(const Loading()));
    });

    test('fetches first page successfully', () async {
      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1)))
          .thenAnswer((_) => Future.value(expectedPage));

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      await pumpEventQueue();

      expect(cubit.state, isA<Loaded>());
      final loadedState = cubit.state as Loaded;
      expect(loadedState.pages, equals([expectedPage]));
      expect(loadedState.pages.first.pageNumber, equals(1));
      expect(loadedState.selectedFilters, equals(emptyFilters));
    });

    test('fetches next page successfully', () async {
      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1)))
          .thenAnswer((_) => Future.value(expectedPage));
      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 2)))
          .thenAnswer((_) => Future.value(unfilteredPage));

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      await pumpEventQueue();
      await cubit.getNextPage();
      await pumpEventQueue();

      expect(cubit.state, isA<Loaded>());
      final loadedState = cubit.state as Loaded;
      expect(loadedState.pages, equals([expectedPage, unfilteredPage]));
      expect(loadedState.selectedFilters, equals(emptyFilters));
    });

    test('filters page by tag', () async {
      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1)))
          .thenAnswer((_) => Future.value(unfilteredPage));

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      cubit.handleTagCheckbox('best');
      await pumpEventQueue();

      expect(cubit.state, isA<Loaded>());
      final loadedState = cubit.state as Loaded;
      expect(loadedState.pages, equals([filteredPage]));
      expect(
        loadedState.selectedFilters,
        equals(
          const SelectedFilters(
            tags: ['best'],
            categories: [],
            minPrice: minPriceValue,
            maxPrice: maxPriceValue,
          ),
        ),
      );
    });

    test('filters page by category', () async {
      const categoryToFilter = CategoryEnum.hotDrinks;

      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1)))
          .thenAnswer((_) => Future.value(unfilteredPage));

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      cubit.handleCategoryCheckbox(categoryToFilter);
      await pumpEventQueue();

      expect(cubit.state, isA<Loaded>());
      final loadedState = cubit.state as Loaded;

      expect(loadedState.pages, equals([filteredPage]));

      expect(
        loadedState.selectedFilters,
        equals(
          const SelectedFilters(
            tags: [],
            categories: [categoryToFilter],
            minPrice: minPriceValue,
            maxPrice: maxPriceValue,
          ),
        ),
      );
    });

    test('filters page by price range and tag', () async {
      const newMinPrice = 20.0;
      const newMaxPrice = 40.0;

      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1)))
          .thenAnswer((_) => Future.value(unfilteredPage));

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      cubit.handlePriceSliderChange(newMinPrice, newMaxPrice);
      cubit.handleTagCheckbox('best');
      await pumpEventQueue();

      expect(cubit.state, isA<Loaded>());
      final loadedState = cubit.state as Loaded;

      expect(loadedState.pages, equals([filteredPage]));

      expect(
        loadedState.selectedFilters,
        equals(
          const SelectedFilters(
            tags: ['best'],
            categories: [],
            minPrice: newMinPrice,
            maxPrice: newMaxPrice,
          ),
        ),
      );
    });

    test('emits Error when getProductsPage call unsuccessful', () async {
      when(() => mockProductsRepository.getProductsPage(const GetProductsPage(pageNumber: 1))).thenThrow(
        Exception(),
      );

      final cubit = HomeCubit(mockProductsRepository);

      await cubit.getNextPage();
      await pumpEventQueue();

      expect(cubit.state, isA<Error>());
    });
  });
}
