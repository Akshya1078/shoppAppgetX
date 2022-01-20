

import 'package:get/get.dart';
import 'package:getx/model/cart.dart';

class CartController extends GetxController{

  Map<int ,CartItem> _items={};
  Map<int,CartItem>get items{
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  double get totalAmount{
    double total=0;
    _items.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });
    return total;
  }



  void addItem(int productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              productTitle:title,
             productQuantity: quantity+ 1,
             productPrice: price));
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: DateTime.now().toString(),
          productTitle: title,
          productPrice: price,
          productQuantity: 1,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }

}