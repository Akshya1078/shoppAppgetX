

import 'package:get/get.dart';
import 'package:getx/model/cart.dart';
import 'package:getx/model/order.dart';

class OrderController extends GetxController{

  List<Order> _orders=[];

  List<Order> get orders{
    return [..._orders];
  }

  void addOrder(List<CartItem>Products,double total){

    _orders.insert(0,
    Order(
      orderId: DateTime.now().toString(),
      products: Products,
      amount: total,
      dateTime: DateTime.now()
    ));
    update();
  }


}