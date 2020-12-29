import 'package:flutter/material.dart';
import 'package:learn_bloc/screens/cart_screen.dart';
import 'package:learn_bloc/screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: Center(
              child: Text(
                'Ammar\'s Shopping App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                softWrap: true,
              ),
            ),
            height: 100,
            color: Theme.of(context).primaryColor),
        SizedBox(
          height: 8,
        ),
        ListTile(
          title: Text('Orders'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          title: Text('My Cart'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName);
          },
          title: Text('Favorites'),
        )
      ],
    );
  }
}
