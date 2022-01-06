// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:appshoes/providers/orders.dart';
import 'package:appshoes/widgets/app_drawer.dart';
import 'package:appshoes/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, index) => OrderWidget(orders.items[index]),
      ),
    );
  }
}
