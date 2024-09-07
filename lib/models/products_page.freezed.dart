// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsPage _$ProductsPageFromJson(Map<String, dynamic> json) {
  return _ProductsPage.fromJson(json);
}

/// @nodoc
mixin _$ProductsPage {
  int get totalPages => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsPageCopyWith<ProductsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsPageCopyWith<$Res> {
  factory $ProductsPageCopyWith(
          ProductsPage value, $Res Function(ProductsPage) then) =
      _$ProductsPageCopyWithImpl<$Res, ProductsPage>;
  @useResult
  $Res call(
      {int totalPages, int pageNumber, int pageSize, List<Product> products});
}

/// @nodoc
class _$ProductsPageCopyWithImpl<$Res, $Val extends ProductsPage>
    implements $ProductsPageCopyWith<$Res> {
  _$ProductsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsPageImplCopyWith<$Res>
    implements $ProductsPageCopyWith<$Res> {
  factory _$$ProductsPageImplCopyWith(
          _$ProductsPageImpl value, $Res Function(_$ProductsPageImpl) then) =
      __$$ProductsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalPages, int pageNumber, int pageSize, List<Product> products});
}

/// @nodoc
class __$$ProductsPageImplCopyWithImpl<$Res>
    extends _$ProductsPageCopyWithImpl<$Res, _$ProductsPageImpl>
    implements _$$ProductsPageImplCopyWith<$Res> {
  __$$ProductsPageImplCopyWithImpl(
      _$ProductsPageImpl _value, $Res Function(_$ProductsPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? products = null,
  }) {
    return _then(_$ProductsPageImpl(
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsPageImpl implements _ProductsPage {
  const _$ProductsPageImpl(
      {required this.totalPages,
      required this.pageNumber,
      required this.pageSize,
      required final List<Product> products})
      : _products = products;

  factory _$ProductsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsPageImplFromJson(json);

  @override
  final int totalPages;
  @override
  final int pageNumber;
  @override
  final int pageSize;
  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductsPage(totalPages: $totalPages, pageNumber: $pageNumber, pageSize: $pageSize, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsPageImpl &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPages, pageNumber, pageSize,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsPageImplCopyWith<_$ProductsPageImpl> get copyWith =>
      __$$ProductsPageImplCopyWithImpl<_$ProductsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsPageImplToJson(
      this,
    );
  }
}

abstract class _ProductsPage implements ProductsPage {
  const factory _ProductsPage(
      {required final int totalPages,
      required final int pageNumber,
      required final int pageSize,
      required final List<Product> products}) = _$ProductsPageImpl;

  factory _ProductsPage.fromJson(Map<String, dynamic> json) =
      _$ProductsPageImpl.fromJson;

  @override
  int get totalPages;
  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductsPageImplCopyWith<_$ProductsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
