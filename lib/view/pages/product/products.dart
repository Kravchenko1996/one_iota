import 'package:flutter/material.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/styles/styles.dart';
import 'package:one_iota/view/widgets/product/products_grid.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/main_scaffold.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() {
    context.read<ProductsProvider>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ProductsProvider provider, __) {
        if (provider.products.isEmpty) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return MainScaffold(
          title: 'oneiota',
          body: SingleChildScrollView(
            child: Container(
              color: $styles.colors.body,
              padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: $styles.insets.md,
                      horizontal: $styles.insets.md,
                    ),
                    child: Text(
                      'Products',
                      style: $styles.text.title.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ProductsGrid(products: provider.products),
                  if (provider.recentlyViewed.isNotEmpty)
                    RecentlyViewedProducts(
                      recentlyViewed: provider.recentlyViewed,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
