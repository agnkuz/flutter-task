// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectedFiltersImpl _$$SelectedFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedFiltersImpl(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryEnumEnumMap, e))
          .toList(),
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SelectedFiltersImplToJson(
        _$SelectedFiltersImpl instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'categories':
          instance.categories.map((e) => _$CategoryEnumEnumMap[e]!).toList(),
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.hotDrinks: 'hotDrinks',
  CategoryEnum.coldDrinks: 'coldDrinks',
  CategoryEnum.other: 'other',
};
