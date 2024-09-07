import 'package:flutter_recruitment_task/constants.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_filters.freezed.dart';
part 'selected_filters.g.dart';

@freezed
class SelectedFilters with _$SelectedFilters {
  const factory SelectedFilters({
    required List<String> tags,
    required List<CategoryEnum> categories,
    required double minPrice,
    required double maxPrice,
  }) = _SelectedFilters;

  factory SelectedFilters.empty() => const SelectedFilters(
        categories: [],
        tags: [],
        minPrice: minPriceValue,
        maxPrice: maxPriceValue,
      );

  factory SelectedFilters.fromJson(Map<String, dynamic> json) => _$SelectedFiltersFromJson(json);
}
