// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_call_super

import 'package:appshoes/providers/orders.dart';
import 'package:appshoes/widgets/app_drawer.dart';
import 'package:appshoes/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('Ocorreu um erro!'));
          } else {
            return Consumer<Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, index) => OrderWidget(orders.items[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
