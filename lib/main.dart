// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:appshoes/providers/auth.dart';
import 'package:appshoes/providers/cart.dart';
import 'package:appshoes/providers/orders.dart';
import 'package:appshoes/providers/products.dart';
import 'package:appshoes/utils/app_routes.dart';
import 'package:appshoes/views/auth_home_screen.dart';
import 'package:appshoes/views/auth_screen.dart';
import 'package:appshoes/views/cart_screen.dart';
import 'package:appshoes/views/orders_screen.dart';
import 'package:appshoes/views/product_detail_screen.dart';
import 'package:appshoes/views/product_form_screen.dart';
import 'package:appshoes/views/products_overview_screen.dart';
import 'package:appshoes/views/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(null, []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            previousProducts!.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrderScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
