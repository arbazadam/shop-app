import 'package:flutter/material.dart';

import 'package:learn_bloc/provider/cart_provider.dart';
import 'package:learn_bloc/provider/order_provider.dart';
import 'package:learn_bloc/screens/orders_screen.dart';

import 'package:learn_bloc/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final String routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Order>(context);

    final cartItemValuesList = cart.items.values.toList();
    final cartItemKeysList = cart.items.keys.toList();
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:'),
                    Spacer(),
                    Chip(
                      label: Text('\$${cart.totalPrice}'),
                    ),
                    FlatButton(
                      onPressed: () {
                        if (cart.items.length > 0) {
                          orderProvider.addOrder(
                              cart.items.values.toList(), cart.totalPrice);
                          cart.clearCart();
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.of(context)
                                .pushNamed(OrdersScreen.routeName);
                          });
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                'There are no items in your cart to order'),
                          ));
                        }
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                )),
            margin: EdgeInsets.all(20),
          ),
          cart.items.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          prodId: cartItemKeysList[index],
                          prodName: cartItemValuesList[index].title,
                          quantity: cartItemValuesList[index].quantity,
                          imageUrl: cartItemValuesList[index].imageUrl,
                          prodPrice: cartItemValuesList[index].price,
                          id: cartItemValuesList[index].id,
                        );
                      },
                      itemCount: cartItemValuesList.length),
                )
              : Text('Start adding items to cart')
        ],
      ),
    );
  }
}
