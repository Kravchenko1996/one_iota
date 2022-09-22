import 'package:one_iota/model/price.dart';

enum StockStatus { inStock }

const Map<String, StockStatus> stockStatuses = {
  "IN STOCK": StockStatus.inStock,
};

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.color,
    required this.description,
  });

  String id;
  String name;
  String image;
  Price price;
  List<dynamic> sizes;
  StockStatus stockStatus;
  String color;
  String description;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['mainImage'],
      price: Price.fromJson(json['price']),
      sizes: json['sizes'],
      stockStatus: stockStatuses[json['stockStatus']]!,
      color: json['colour'],
      description: json['description'],
    );
  }

  bool isInStock() {
    return stockStatus == StockStatus.inStock;
  }
}
