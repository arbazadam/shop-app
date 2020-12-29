import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void removeFromCart(String prodId) {
    if (_items.containsKey(prodId)) {
      _items.remove(prodId);
      notifyListeners();
    }
  }

void removeOne(String productId)
{
  if (_items.containsKey(productId) && _items[productId].quantity>0) {
_items.update(productId, (existingValue) => CartItem(
              imageUrl: existingValue.imageUrl,
              id: existingValue.id,
              title: existingValue.title,
              price: existingValue.price,
              quantity: existingValue.quantity -1));
  }
}
  void addItem(String productId, String title, double price, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingValue) => CartItem(
              imageUrl: existingValue.imageUrl,
              id: existingValue.id,
              title: existingValue.title,
              price: existingValue.price,
              quantity: existingValue.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              imageUrl: imageUrl,
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  int get itemCount {
    int count = 0;
    _items.forEach((key, cartItem) {
      count = count + cartItem.quantity;
    });
    return count;
  }

  double get totalPrice {
    double price = 0.0;
    _items.forEach((key, cartItem) {
      price = price + cartItem.quantity * cartItem.price;
    });
    return price;
  }

  List<Map<String, CartItem>> get convertMapToList {
    return _items.values.toList();
  }
  void clearCart()
  {
    _items.clear();
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
      @required this.imageUrl});
}
