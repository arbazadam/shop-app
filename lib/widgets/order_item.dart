import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_bloc/provider/order_provider.dart';

class OrderItems extends StatefulWidget {
  final OrderItem order;

  OrderItems(this.order);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateOfOrder),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.listOfProducts.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.listOfProducts
                    .map(
                      (prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${prod.quantity}x \$${prod.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
