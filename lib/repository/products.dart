import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

const baseUrl = 'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}

class RestProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    http.Response response = await http.get(
      Uri.parse('$baseUrl/products.json'),
    );
    if (response.statusCode == 200) {
      List<Product> products = [];
      List<dynamic> decodedResponse = json.decode(response.body)['data'];
      for (var element in decodedResponse) {
        products.add(Product.fromJson(element));
      }
      return products;
    } else {
      return [];
    }
  }
}
