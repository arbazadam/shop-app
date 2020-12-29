import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/cart_provider.dart';
import 'package:learn_bloc/provider/order_provider.dart';
import 'package:learn_bloc/screens/cart_screen.dart';
import 'package:learn_bloc/screens/header.dart';
import 'package:learn_bloc/screens/orders_screen.dart';
import 'package:learn_bloc/widgets/badge.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './provider/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Order()),
      ],
      child: MaterialApp(
          initialRoute: ProductsOverviewScreen.routeName,
          title: 'MyShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.deepOrange,
          ),
          home: ProductsOverviewScreen(),
          routes: {
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen()
          }),
    );
  }
}
