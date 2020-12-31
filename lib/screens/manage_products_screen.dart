import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/product_provider.dart';
import 'package:learn_bloc/screens/edit_product_screen.dart';
import 'package:learn_bloc/widgets/app_drawer.dart';
import 'package:learn_bloc/widgets/cart_item.dart';
import 'package:learn_bloc/widgets/manage_product_item.dart';
import 'package:provider/provider.dart';

class ManageProductsScreen extends StatelessWidget {
  static final routeName = "/manage-products";
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productsList = products.items;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Manage Products'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductsScreen.routeName);
                })
          ],
        ),
        body: ListView.separated(
            separatorBuilder: (_, index) => Divider(),
            itemBuilder: (_, index) => ManageProducts(
                imageUrl: productsList[index].imageUrl,
                productName: productsList[index].title),
            itemCount: products.items.length));
  }
}
