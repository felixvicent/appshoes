// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:appshoes/providers/products.dart';
import 'package:appshoes/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = productsProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) => ProductItem(products[index]),
      ),
    );
  }
}
