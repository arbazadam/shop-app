import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
final String prodId;
  String prodName;
  double prodPrice;
  int quantity;
  final String id;

  CartItemWidget(
      {
        @required this.prodId,
      @required this.prodName,
      @required this.quantity,
      @required this.id,
      @required this.imageUrl,
      @required this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction){
Provider.of<Cart>(context,listen: false).removeFromCart(prodId);
      },
      background: Container(
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        color: Colors.red,
      ),
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(prodName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'X$quantity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Total price: ${(quantity * prodPrice)}')
              ],
            ),
          ),
        ),
        elevation: 8,
      ),
    );
  }
}
