// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:appshoes/data/dummy_data.dart';
import 'package:appshoes/models/product.dart';
import 'package:appshoes/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProdutcs = DUMMY_PRODUTCTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProdutcs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) => ProductItem(loadedProdutcs[index]),
      ),
    );
  }
}
