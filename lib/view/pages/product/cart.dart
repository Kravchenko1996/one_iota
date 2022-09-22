import 'package:flutter/material.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/styles/styles.dart';
import 'package:one_iota/view/widgets/product/products_grid.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/floating_container.dart';
import 'package:one_iota/view/widgets/shared/main_scaffold.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Your Cart',
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all($styles.insets.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductsGrid(
                    products: context.read<ProductsProvider>().cart,
                  ),
                  if (context
                      .read<ProductsProvider>()
                      .recentlyViewed
                      .isNotEmpty)
                    Column(
                      children: [
                        const Divider(thickness: 1),
                        RecentlyViewedProducts(
                          recentlyViewed:
                              context.read<ProductsProvider>().recentlyViewed,
                        ),
                      ],
                    ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
          FloatingContainer(
            text:
                "£${context.read<ProductsProvider>().countCartSubtotal().toString()}",
            onButtonClick: () {},
            buttonText: 'Checkout',
          )
        ],
      ),
    );
  }
}
