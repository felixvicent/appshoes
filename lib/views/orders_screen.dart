// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:appshoes/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      drawer: AppDrawer(),
    );
  }
}
