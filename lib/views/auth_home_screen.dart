// ignore_for_file: use_key_in_widget_constructors

import 'package:appshoes/providers/auth.dart';
import 'package:appshoes/views/auth_screen.dart';
import 'package:appshoes/views/products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewScreen() : AuthScreen();
  }
}
