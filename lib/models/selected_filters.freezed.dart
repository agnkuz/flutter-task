// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectedFilters _$SelectedFiltersFromJson(Map<String, dynamic> json) {
  return _SelectedFilters.fromJson(json);
}

/// @nodoc
mixin _$SelectedFilters {
  List<String> get tags => throw _privateConstructorUsedError;
  List<CategoryEnum> get categories => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedFiltersCopyWith<SelectedFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedFiltersCopyWith<$Res> {
  factory $SelectedFiltersCopyWith(
          SelectedFilters value, $Res Function(SelectedFilters) then) =
      _$SelectedFiltersCopyWithImpl<$Res, SelectedFilters>;
  @useResult
  $Res call(
      {List<String> tags,
      List<CategoryEnum> categories,
      double? minPrice,
      double? maxPrice});
}

/// @nodoc
class _$SelectedFiltersCopyWithImpl<$Res, $Val extends SelectedFilters>
    implements $SelectedFiltersCopyWith<$Res> {
  _$SelectedFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? categories = null,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEnum>,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedFiltersImplCopyWith<$Res>
    implements $SelectedFiltersCopyWith<$Res> {
  factory _$$SelectedFiltersImplCopyWith(_$SelectedFiltersImpl value,
          $Res Function(_$SelectedFiltersImpl) then) =
      __$$SelectedFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> tags,
      List<CategoryEnum> categories,
      double? minPrice,
      double? maxPrice});
}

/// @nodoc
class __$$SelectedFiltersImplCopyWithImpl<$Res>
    extends _$SelectedFiltersCopyWithImpl<$Res, _$SelectedFiltersImpl>
    implements _$$SelectedFiltersImplCopyWith<$Res> {
  __$$SelectedFiltersImplCopyWithImpl(
      _$SelectedFiltersImpl _value, $Res Function(_$SelectedFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? categories = null,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
  }) {
    return _then(_$SelectedFiltersImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEnum>,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedFiltersImpl implements _SelectedFilters {
  const _$SelectedFiltersImpl(
      {required final List<String> tags,
      required final List<CategoryEnum> categories,
      this.minPrice,
      this.maxPrice})
      : _tags = tags,
        _categories = categories;

  factory _$SelectedFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedFiltersImplFromJson(json);

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<CategoryEnum> _categories;
  @override
  List<CategoryEnum> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final double? minPrice;
  @override
  final double? maxPrice;

  @override
  String toString() {
    return 'SelectedFilters(tags: $tags, categories: $categories, minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedFiltersImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_categories),
      minPrice,
      maxPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedFiltersImplCopyWith<_$SelectedFiltersImpl> get copyWith =>
      __$$SelectedFiltersImplCopyWithImpl<_$SelectedFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedFiltersImplToJson(
      this,
    );
  }
}

abstract class _SelectedFilters implements SelectedFilters {
  const factory _SelectedFilters(
      {required final List<String> tags,
      required final List<CategoryEnum> categories,
      final double? minPrice,
      final double? maxPrice}) = _$SelectedFiltersImpl;

  factory _SelectedFilters.fromJson(Map<String, dynamic> json) =
      _$SelectedFiltersImpl.fromJson;

  @override
  List<String> get tags;
  @override
  List<CategoryEnum> get categories;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  @JsonKey(ignore: true)
  _$$SelectedFiltersImplCopyWith<_$SelectedFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
