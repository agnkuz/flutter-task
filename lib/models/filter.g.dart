// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      filterEnum: $enumDecode(_$FilterEnumEnumMap, json['filterEnum']),
      names: (json['names'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'filterEnum': _$FilterEnumEnumMap[instance.filterEnum]!,
      'names': instance.names,
    };

const _$FilterEnumEnumMap = {
  FilterEnum.category: 'category',
  FilterEnum.tag: 'tag',
  FilterEnum.price: 'price',
};
