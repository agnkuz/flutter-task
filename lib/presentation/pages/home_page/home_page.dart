import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/models/products_page.dart';
import 'package:flutter_recruitment_task/presentation/pages/home_page/home_cubit.dart';
import 'package:flutter_recruitment_task/presentation/widgets/big_text.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

const _mainPadding = EdgeInsets.all(16.0);

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.productId});

  final String? productId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getNextPage(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText('Products'),
      ),
      body: Padding(
        padding: _mainPadding,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return switch (state) {
              Error() => BigText('Error: ${state.error}'),
              Loading() => const BigText('Loading...'),
              Loaded() => _LoadedWidget(state: state),
            };
          },
        ),
      ),
    );
  }
}

class _LoadedWidget extends StatefulWidget {
  const _LoadedWidget({
    required this.state,
  });

  final Loaded state;

  @override
  State<_LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<_LoadedWidget> {
  late final ScrollController _scrollController = ScrollController();
  late final ListObserverController _observerController = ListObserverController(controller: _scrollController);
  late final List<Product> _products;

  @override
  void initState() {
    super.initState();
    _products = widget.state.pages.map((page) => page.products).expand((product) => product).toList();
    final productToScroll = widget.state.productToScrollTo;

    if (productToScroll != null) {
      final indexToScroll = _products.indexOf(widget.state.productToScrollTo!);

      Future.delayed(const Duration(milliseconds: 500), () {
        _observerController.animateTo(
          index: indexToScroll,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListViewObserver(
      controller: _observerController,
      child: _ProductsList(
        products: _products,
        scrollController: _scrollController,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _ProductsList extends StatefulWidget {
  const _ProductsList({
    required this.products,
    required this.scrollController,
  });

  final List<Product> products;
  final ScrollController scrollController;

  @override
  State<_ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<_ProductsList> {
  @override
  Widget build(BuildContext context) {
    final products = widget.products;

    return ListView.separated(
      controller: widget.scrollController,
      itemCount: products.length,
      itemBuilder: (context, index) {
        if (index == products.length - 1) {
          return const _GetNextPageButton();
        }

        return _ProductCard(
          isProductToScrollTo: 10 == index,
          product: products[index],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class _ProductCard extends StatefulWidget {
  const _ProductCard({
    required this.product,
    required this.isProductToScrollTo,
  });

  final Product product;
  final bool isProductToScrollTo;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(widget.product.name),
          _Tags(product: widget.product),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: product.tags.map(_TagWidget.new).toList(),
    );
  }
}

class _TagWidget extends StatelessWidget {
  const _TagWidget(this.tag);

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        color: MaterialStateProperty.all(_getTagColor()),
        label: Text(tag.label),
      ),
    );
  }

  Color _getTagColor() {
    String colorString = '0xFF${tag.color.substring(1)}';
    // in case the color parameter is malformed, use eg. white
    Color color = Color(int.tryParse(colorString) ?? 0xFFFFFF);

    return color;
  }
}

class _GetNextPageButton extends StatelessWidget {
  const _GetNextPageButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<HomeCubit>().getNextPage,
      child: const BigText('Get next page'),
    );
  }
}
