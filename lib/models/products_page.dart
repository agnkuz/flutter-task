import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_page.g.dart';
part 'products_page.freezed.dart';

@freezed
class ProductsPage with _$ProductsPage {
  const factory ProductsPage({
    required int totalPages,
    required int pageNumber,
    required int pageSize,
    required List<Product> products,
  }) = _ProductsPage;

  factory ProductsPage.fromJson(Map<String, dynamic> json) => _$ProductsPageFromJson(json);
}

@JsonSerializable()
class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.mainImage,
    required this.description,
    required this.available,
    required this.isFavorite,
    required this.isBlurred,
    required this.sellerId,
    required this.tags,
    required this.offer,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  final String id;
  final String name;
  final String mainImage;
  final String description;
  final bool available;
  final bool? isFavorite;
  final bool? isBlurred;
  final String sellerId;
  final List<Tag> tags;
  final Offer offer;

  @override
  List<Object?> get props => [
        id,
        name,
        mainImage,
        description,
        available,
        isFavorite,
        isBlurred,
        sellerId,
        tags,
        offer,
      ];
}

@JsonSerializable()
class Offer {
  Offer({
    required this.skuId,
    required this.sellerId,
    required this.sellerName,
    required this.subtitle,
    required this.isSponsored,
    required this.isBest,
    required this.regularPrice,
    required this.promotionalPrice,
    required this.normalizedPrice,
    required this.promotionalNormalizedPrice,
    required this.omnibusPrice,
    required this.omnibusLabel,
    required this.tags,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  final String skuId;
  final String sellerId;
  final String sellerName;
  final String subtitle;
  final bool? isSponsored;
  final bool? isBest;
  final Price regularPrice;
  final Price? promotionalPrice;
  final NormalizedPrice? normalizedPrice;
  final NormalizedPrice? promotionalNormalizedPrice;
  final Price? omnibusPrice;
  final String? omnibusLabel;
  final List<Tag>? tags;
}

@JsonSerializable()
class Tag {
  Tag({
    required this.tag,
    required this.label,
    required this.color,
    required this.labelColor,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  final String tag;
  final String label;
  final String color;
  final String labelColor;
}

@JsonSerializable()
class Price {
  Price({
    required this.amount,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  final double amount;
  final String currency;
}

@JsonSerializable()
class NormalizedPrice {
  NormalizedPrice({
    required this.amount,
    required this.currency,
    required this.unitLabel,
  });

  factory NormalizedPrice.fromJson(Map<String, dynamic> json) => _$NormalizedPriceFromJson(json);

  final double amount;
  final String currency;
  final String? unitLabel;
}
