import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/order_provider.dart';

class OrderItems extends StatelessWidget {
  final Order orderData;

  OrderItems({this.orderData});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Text(orderData.listofOrderItems[index].id),
        );
      },
      itemCount: orderData.listofOrderItems.length,
    );
  }
}
