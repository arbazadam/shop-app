import 'package:flutter/material.dart';

class EditProductsScreen extends StatefulWidget {
  static final routeName = '/edit-product';
  @override
  _EditProductsScreenState createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              getTextField('Title', () {}),
              getTextField('Image url', () {}),
              getTextField('description', () {}),
              SizedBox(height: 10),
              FlatButton(onPressed: () {}, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextField(String label, Function validator) {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          )),
          filled: true,
          hintText: label,
          hintStyle: TextStyle(color: Colors.blue[600])),
    );
  }
}
