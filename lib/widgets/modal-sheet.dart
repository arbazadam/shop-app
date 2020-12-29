import 'package:flutter/material.dart';
import 'package:learn_bloc/provider/product.dart';
import 'package:learn_bloc/provider/product_provider.dart';
import 'package:provider/provider.dart';


class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 10,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Product Name'),
          ),
          TextField(
            
            decoration: InputDecoration(hintText: 'Image url'),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              Navigator.pop(context);
              
            },
          )
        ],
      ),
    );
  }
}
