import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx/controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int productId;
  final double price;
  final int quantity;
  final String title;

   CartItem({
    required this.price,
     required this.title,
     required this.id,
     required this.quantity,
     required this.productId

}) ;

  @override
  Widget build(BuildContext context) {
    var cartController =Get.put(CartController());
    return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(Icons.delete,color: Colors.black87,),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        ),
      direction:  DismissDirection.endToStart,
      onDismissed: (direction){
          cartController.removeitem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Chip(
              label: Padding(
                padding: EdgeInsets.all(8),
                child: Text('₦$price'),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            subtitle: Text('Total: ₦${(price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),

    );
  }
}
