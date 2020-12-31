import 'package:flutter/material.dart';
import 'package:learn_bloc/screens/edit_product_screen.dart';

class ManageProducts extends StatelessWidget {
  final String imageUrl;
  final String productName;

  ManageProducts({this.imageUrl, this.productName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(EditProductsScreen.routeName);
                  },
                  color: Theme.of(context).primaryColor),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
                color: Theme.of(context).errorColor,
              )
            ],
          ),
        ),
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        title: Text(productName),
      ),
    );
  }
}
