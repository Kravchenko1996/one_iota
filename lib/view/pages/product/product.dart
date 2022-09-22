import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_iota/model/product.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/styles/styles.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/floating_container.dart';
import 'package:one_iota/view/widgets/shared/main_scaffold.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: product.name,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $styles.insets.lg,
                      vertical: $styles.insets.xl,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.image,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        SizedBox(height: $styles.insets.lg),
                        Text(
                          product.name,
                          style: $styles.text.title.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: $styles.insets.md),
                        Text(product.description),
                        SizedBox(height: $styles.insets.md),
                        _SizesList(sizes: product.sizes),
                      ],
                    ),
                  ),
                  if (context
                      .read<ProductsProvider>()
                      .recentlyViewed
                      .isNotEmpty)
                    Column(
                      children: [
                        const Divider(thickness: 1),
                        Padding(
                          padding: EdgeInsets.all($styles.insets.md),
                          child: RecentlyViewedProducts(
                            recentlyViewed:
                                context.read<ProductsProvider>().recentlyViewed,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
            FloatingContainer(
              text: '${product.price.amount} ${product.price.currency}',
              buttonText: "Add to Cart",
              onButtonClick: product.isInStock()
                  ? () => context.read<ProductsProvider>().addToCart(product)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _SizesList extends StatelessWidget {
  const _SizesList({Key? key, required this.sizes}) : super(key: key);

  final List<dynamic> sizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Sizes:", style: $styles.text.content),
        SizedBox(width: $styles.insets.md),
        ...sizes.map((size) {
          return Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: $styles.insets.md),
            decoration: BoxDecoration(
              border: Border.all(color: $styles.colors.greyStrong, width: 2),
            ),
            child: Center(
              child: Text(
                size,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
