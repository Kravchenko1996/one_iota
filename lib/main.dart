import 'package:flutter/material.dart';
import 'package:one_iota/provider/products.dart';
import 'package:one_iota/view/pages/product/products.dart';
import 'package:provider/provider.dart';

import 'repository/products.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(RestProductRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductsPage(),
    );
  }
}
