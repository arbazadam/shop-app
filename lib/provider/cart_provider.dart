import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final _items = {};

//Cart item is stored as a Map with product id as key and Cart item as a value.
//Here we are returning cart items.
  Map<String, CartItem> get items {
    return {..._items};
  }

//removes the particular product from cart.
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
  if(_items[productId].quantity==0)
              {
                removeFromCart(productId);
              }
              notifyListeners();
}

//Adds item to the cart and also increases the quantity if the product already exists in the cart.
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

  // int get itemCount {
  //   int count = 0;
  //   _items.forEach((key, cartItem) {
  //     count = count + cartItem.quantity;
  //   });
  //   return count;
  // }

//Returning the count of items in the cart.
  int get itemCount{
    return _items.length;
  }

//Sums the total price of the items in cart and returns the value. //Grand total
  double get totalPrice {
    double price = 0.0;
    _items.forEach((key, cartItem) {
      price = price + cartItem.quantity * cartItem.price;
    });
    return price;
  }

//Converting all the values of the map to a list.
  List<CartItem> get convertMapToList {
    return _items.values.toList();
  }

  //Clearing all the items in the cart(which is basically a map).
  void clearCart()
  {
    _items.clear();
    notifyListeners();
  }
}

//This class represents each cart item.
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
