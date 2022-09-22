import 'package:flutter/material.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/view/widgets/product/products_grid.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/submit_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('oneiota'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductsGrid(products: context.read<ProductsProvider>().products),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Subtotal: ${context.read<ProductsProvider>().countCartSubtotal()}',
                ),
              ),
              Center(
                child: SubmitButton(
                  onTap: () {},
                  text: 'Proceed to checkout',
                ),
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
    );
  }
}
