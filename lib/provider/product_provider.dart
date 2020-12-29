import 'package:flutter/material.dart';
import 'package:learn_bloc/constants.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = products;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
