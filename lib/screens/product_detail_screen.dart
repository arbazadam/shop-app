import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/cart_provider.dart';
import 'package:learn_bloc/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 10),
            Row(
              children: [
                Text('\$${loadedProduct.price}'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],
        ),
      ),
    );
  }
}