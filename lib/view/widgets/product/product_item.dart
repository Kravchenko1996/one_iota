import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/styles/styles.dart';
import 'package:one_iota/view/pages/product/product.dart';
import 'package:provider/provider.dart';

import '../../../model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectProduct(context),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: $styles.colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: $styles.insets.lg),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Transform.rotate(
                    angle: 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        height: 144,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all($styles.insets.lg),
                  decoration: BoxDecoration(
                    color: $styles.colors.greyStrong,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  width: double.infinity,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: $styles.text.content.copyWith(
                          color: $styles.colors.white,
                        ),
                      ),
                      Text(
                        '${product.price.amount} ${product.price.currency}',
                        style: $styles.text.price.copyWith(
                          color: $styles.colors.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectProduct(BuildContext context) {
    context.read<ProductsProvider>().addToRecentlyViewed(product);
    _toProductPage(context);
  }

  void _toProductPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductPage(product: product),
      ),
    );
  }
}
