import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/constants.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_cubit.dart';

class ExpansionPriceWidget extends StatelessWidget {
  const ExpansionPriceWidget({
    super.key,
    required this.selectedFilters,
  });

  final SelectedFilters? selectedFilters;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: selectedFilters?.minPrice != minPriceValue || selectedFilters?.maxPrice != maxPriceValue,
      title: const Text('Cena'),
      children: [
        RangeSlider(
          values: RangeValues(
            selectedFilters?.minPrice ?? minPriceValue,
            selectedFilters?.maxPrice ?? maxPriceValue,
          ),
          min: minPriceValue,
          max: maxPriceValue,
          onChanged: (RangeValues values) =>
              context.read<HomeCubit>().handlePriceSliderChange(values.start, values.end),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${(selectedFilters?.minPrice ?? minPriceValue).toStringAsFixed(0)} zł'),
            Text('${(selectedFilters?.maxPrice ?? maxPriceValue).toStringAsFixed(0)} zł'),
          ],
        ),
      ],
    );
  }
}
