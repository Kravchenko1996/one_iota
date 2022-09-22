import 'package:flutter/material.dart';
import 'package:one_iota/model/product.dart';
import 'package:one_iota/styles/styles.dart';
import 'package:one_iota/view/widgets/product/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  bool _isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (_isPortrait(context)) ? 2 : 3,
        childAspectRatio: 2 / 3.2,
      ),
      itemBuilder: (_, int index) {
        int subtractor = products.length % 2 == 0 ? 2 : 1;
        double bottomPadding = index >= products.length - subtractor
            ? $styles.insets.xl
            : $styles.insets.sm;
        return Padding(
          padding: EdgeInsets.only(
            left: $styles.insets.sm,
            top: $styles.insets.sm,
            right: $styles.insets.sm,
            bottom: bottomPadding,
          ),
          child: ProductItem(
            product: products[index],
          ),
        );
      },
    );
  }
}
