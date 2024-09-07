import 'package:equatable/equatable.dart';

abstract class Filter extends Equatable {}

class TagFilter extends Filter {
  TagFilter({
    required this.names,
  });

  final Set<String> names;

  @override
  List<Object?> get props => [names];
}

class PriceFilter extends Filter {
  PriceFilter({
    required this.minValue,
    required this.maxValue,
  });

  final double minValue;
  final double maxValue;

  @override
  List<Object?> get props => [minValue, maxValue];
}

enum CategoryEnum {
  hotDrinks('Gorące napoje', ['herbata', 'kawa', 'melisa']),
  coldDrinks('Zimne napoje', ['woda', 'sok', 'cola']),
  other('Artykuły spożywcze', ['makaron', 'mąka', 'musli']);

  const CategoryEnum(this.stringName, this.keyWords);

  final String stringName;
  final List<String> keyWords;
}

enum FilterType {
  category,
  tag,
}
