
import 'package:getx/model/cart.dart';

class Order{

  final String orderId;
  final double amount;
  final List<CartItem>products;
  final DateTime dateTime;
  Order({
    required this.amount,
    required this.orderId,
    required this.products,
    required this.dateTime
});
}