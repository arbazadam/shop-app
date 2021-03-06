import 'package:flutter/foundation.dart';
import 'package:learn_bloc/provider/cart_provider.dart';

class Order with ChangeNotifier {
  List<OrderItem> _listOfOrderItems = [];

  //Returning the list of order items.
  List<OrderItem> get listofOrderItems {
    return [..._listOfOrderItems];
  }

  //Adding an item to the order list. 
  //Using the insert method instead of add to insert the new orders at first index.
  void addOrder(List<CartItem> cartProducts, double totalAmount) {
    if(cartProducts.isNotEmpty)
    {
    _listOfOrderItems.insert(
        0,
        OrderItem(
            amount: totalAmount,
            listOfProducts: cartProducts,
            id: DateTime.now().toString(),
            dateOfOrder: DateTime.now()));
            notifyListeners();
    }
  }
}

//This is how each OrderItem will look like.
class OrderItem {
  final List<CartItem> listOfProducts;
  final DateTime dateOfOrder;
  final String id;
  final double amount;

  OrderItem({
    @required this.id,
    @required this.listOfProducts,
    @required this.amount,
    @required this.dateOfOrder,
  });
}
