import 'package:flutter/material.dart';
import 'package:one_iota/model/product.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/styles/styles.dart';

import 'package:one_iota/view/pages/product/cart.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: $styles.text.title.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: $styles.colors.accent,
          ),
        ),
        foregroundColor: $styles.colors.white,
        backgroundColor: $styles.colors.greyStrong,
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
      body: body,
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
