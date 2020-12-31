import 'package:flutter/material.dart';
import 'package:learn_bloc/screens/cart_screen.dart';
import 'package:learn_bloc/screens/manage_products_screen.dart';
import 'package:learn_bloc/screens/orders_screen.dart';
import 'package:learn_bloc/screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Arbaz Adam"),
          accountEmail: Text("arbazadam13@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.blue
                : Colors.white,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.card_giftcard),
          onTap: () {
            Navigator.of(context).pushNamed(OrdersScreen.routeName);
          },
          title: Text('Orders'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          title: Text('My Cart'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_rounded),
          onTap: () {
            Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName);
          },
          title: Text('Favorites'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          onTap: () {
            Navigator.of(context).pushNamed(ManageProductsScreen.routeName);
          },
          title: Text('Manage Products'),
        )
      ],
    );
  }
}
