import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_iota/model/product.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/view/pages/product/cart.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/cart.dart';
import 'package:one_iota/view/widgets/shared/submit_button.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          CartIconButton(
            counter: context.watch<ProductsProvider>().cart.length,
            onTap: () => _toCartPage(
              context,
              context.read<ProductsProvider>().cart,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description),
                CachedNetworkImage(
                  imageUrl: product.image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Text('sizes: ${product.sizes.toString()}'),
                Text(
                  'price: ${product.price.amount} ${product.price.currency}',
                ),
                SubmitButton(
                  onTap: product.isInStock()
                      ? () =>
                          context.read<ProductsProvider>().addToCart(product)
                      : null,
                  text: 'Add to cart',
                ),
                if (context.read<ProductsProvider>().recentlyViewed.isNotEmpty)
                  RecentlyViewedProducts(
                    recentlyViewed:
                        context.read<ProductsProvider>().recentlyViewed,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toCartPage(BuildContext context, List<Product> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }
}
