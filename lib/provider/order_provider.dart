import 'package:flutter/foundation.dart';
import 'package:learn_bloc/provider/cart_provider.dart';

class Order with ChangeNotifier
{
List<CartItem> listOfProducts;
List<OrderItem> _listOfOrderItems=[];

List<OrderItem> get listofOrderItems{
  return [..._listOfOrderItems];
}
}

class OrderItem
{

}