import 'package:flutter/material.dart';
import 'package:one_iota/model/product.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/view/pages/product/cart.dart';
import 'package:one_iota/view/widgets/product/products_grid.dart';
import 'package:one_iota/view/widgets/product/recently_viewed.dart';
import 'package:one_iota/view/widgets/shared/cart.dart';
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
        return Scaffold(
          appBar: AppBar(
            title: const Text('oneiota'),
            actions: [
              CartIconButton(
                counter: provider.cart.length,
                onTap: () => _toCartPage(context, provider.cart),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Products'),
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

  void _toCartPage(BuildContext context, List<Product> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CartPage(),
      ),
    );
  }
}
