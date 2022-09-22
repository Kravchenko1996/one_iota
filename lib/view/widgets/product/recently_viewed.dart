import 'package:flutter/material.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('Recently Viewed'),
        ),
        ProductsGrid(products: recentlyViewed),
      ],
    );
  }
}
