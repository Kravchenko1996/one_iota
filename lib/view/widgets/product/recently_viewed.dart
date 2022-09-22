import 'package:flutter/material.dart';
import 'package:one_iota/styles/styles.dart';

import '../../../model/product.dart';
import 'products_grid.dart';

class RecentlyViewedProducts extends StatelessWidget {
  const RecentlyViewedProducts({
    Key? key,
    required this.recentlyViewed,
  }) : super(key: key);

  final List<Product> recentlyViewed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all($styles.insets.md),
          child: const Text('Recently Viewed'),
        ),
        ProductsGrid(products: recentlyViewed),
      ],
    );
  }
}
