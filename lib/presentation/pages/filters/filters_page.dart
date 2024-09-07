import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/models/filter.dart';
import 'package:flutter_recruitment_task/presentation/pages/filters/expansion_price_widget.dart';
import 'package:flutter_recruitment_task/presentation/pages/filters/expansion_tile_widget.dart';
import 'package:flutter_recruitment_task/presentation/pages/filters/filters_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_state.dart';
import 'package:flutter_recruitment_task/presentation/widgets/big_text.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    super.key,
    required this.onApplyTap,
    required this.onClearTap,
  });

  final VoidCallback onApplyTap;
  final VoidCallback onClearTap;

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  void initState() {
    super.initState();
    context.read<FiltersCubit>().loadFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Filtry'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                widget.onClearTap.call();
              },
              child: const Text('Clear'),
            ),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Zastosuj'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<FiltersCubit, FiltersState>(
        builder: (context, state) {
          return switch (state) {
            FiltersLoading() => const Padding(
                padding: EdgeInsets.all(24),
                child: BigText('Loading...'),
              ),
            FiltersError() => BigText('Error: ${state.error}'),
            FiltersLoaded() => _getLoadedWidget(state),
          };
        },
      ),
    );
  }

  Widget _getLoadedWidget(FiltersLoaded state) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, homeState) {
        final selectedFilters = switch (homeState) {
          Loaded() => homeState.selectedFilters,
          Loading() => null,
          Error() => null,
        };

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ExpansionTileWidget(
              title: 'Kategorie',
              children: state.categoriesFilter.map((e) => e.stringName).toList(),
              selectedFilters: selectedFilters,
              filterType: FilterType.category,
            ),
            const SizedBox(height: 10),
            ExpansionTileWidget(
              title: 'Tagi',
              children: state.tagsFilter.names.toList(),
              selectedFilters: selectedFilters,
              filterType: FilterType.tag,
            ),
            const SizedBox(height: 10),
            ExpansionPriceWidget(selectedFilters: selectedFilters),
            const SizedBox(height: 200),
          ],
        );
      },
    );
  }
}
