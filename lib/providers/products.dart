// ignore_for_file: prefer_final_fields, unnecessary_null_comparison

import 'dart:convert';
import 'dart:math';

import 'package:appshoes/data/dummy_data.dart';
import 'package:appshoes/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Future<void> addProduct(Product newProduct) {
    const url =
        'https://appshoes-b3106-default-rtdb.firebaseio.com/products.json';

    return post(
      Uri.parse(url),
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavorite': newProduct.isFavorite,
      }),
    ).then((response) {
      _items.add(Product(
        id: json.decode(response.body)['name'],
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ));

      notifyListeners();
    });
  }

  void updateProduct(Product product) {
    if (product == null && product.id == null) {
      return;
    }

    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((product) => product.id == id);

    if (index >= 0) {
      _items.removeWhere((product) => product.id == id);
      notifyListeners();
    }
  }
}
