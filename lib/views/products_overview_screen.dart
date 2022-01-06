// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, import_of_legacy_library_into_null_safe, constant_identifier_names, unused_local_variable

import 'package:appshoes/widgets/product_grid.dart';
import 'package:flutter/material.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              if (selectedValue == FilterOption.Favorite) {
                setState(() {
                  _showFavoriteOnly = true;
                });
              } else {
                setState(() {
                  _showFavoriteOnly = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOption.All,
              )
            ],
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
