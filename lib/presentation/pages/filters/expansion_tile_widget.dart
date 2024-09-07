import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/models/selected_filters.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_cubit.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
    required this.selectedFilters,
    required this.filterType,
  });

  final String title;
  final List<String> children;
  final SelectedFilters? selectedFilters;
  final FilterType filterType;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: children.any((element) => _getValue(element)),
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 32),
      title: Text(title),
      children: [
        ...children.map(
          (item) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text(
                item,
                textAlign: TextAlign.left,
              ),
              trailing: Checkbox(
                value: _getValue(item),
                onChanged: (value) {
                  if (filterType == FilterType.category) {
                    context.read<HomeCubit>().handleCategoryCheckbox(
                          CategoryEnum.values.firstWhere((element) => element.stringName == item),
                        );
                  } else {
                    context.read<HomeCubit>().handleTagCheckbox(item);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }

  bool _getValue(String item) =>
      (filterType == FilterType.category
          ? selectedFilters?.categories.map((e) => e.stringName).contains(item)
          : selectedFilters?.tags.contains(item)) ??
      false;
}
