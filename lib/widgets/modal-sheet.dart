import 'package:flutter/material.dart';

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
