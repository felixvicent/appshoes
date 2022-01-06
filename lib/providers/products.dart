// ignore_for_file: prefer_final_fields

import 'package:appshoes/data/dummy_data.dart';
import 'package:appshoes/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
