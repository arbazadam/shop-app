import 'package:flutter/foundation.dart';
import 'package:learn_bloc/provider/cart_provider.dart';

class Order with ChangeNotifier {
  List<OrderItem> _listOfOrderItems = [];

  List<OrderItem> get listofOrderItems {
    return [..._listOfOrderItems];
  }

  void addOrder(List<CartItem> cartProducts, double totalAmount) {
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
