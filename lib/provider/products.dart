import 'package:flutter/material.dart';

import '../model/product.dart';
import '../repository/products.dart';

class ProductsProvider with ChangeNotifier {
  ProductsProvider(this._productRepository);

  final ProductRepository _productRepository;

  List<Product> _products = [];
  final List<Product> _recentlyViewed = [];
  final List<Product> _cart = [];

  double _total = 0.0;

  List<Product> get products => _products;
  List<Product> get recentlyViewed => _recentlyViewed;
  List<Product> get cart => _cart;

  double get total => _total;

  void fetchProducts() async {
    _products = await _productRepository.fetchProducts();
    notifyListeners();
  }

  void addToRecentlyViewed(Product product) {
    _recentlyViewed.add(product);
    notifyListeners();
  }

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  double countCartSubtotal() {
    _total = 0;
    for (Product element in cart) {
      _total += double.parse(element.price.amount);
    }
    return _total;
  }
}
