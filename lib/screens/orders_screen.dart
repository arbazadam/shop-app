import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/order_provider.dart';
import 'package:learn_bloc/widgets/app_drawer.dart';
import 'package:learn_bloc/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static final routeName = "/orders-screen";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: orderData.listofOrderItems.length > 0
          ? ListView.builder(
              itemCount: orderData.listofOrderItems.length,
              itemBuilder: (ctx, i) =>
                  OrderItems(orderData.listofOrderItems[i]),
            )
          : Center(
              child: Text('Start shopping now'),
            ),
    );
  }
}
