// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:appshoes/providers/cart.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
