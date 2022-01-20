import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx/controller/cart_controller.dart';
import 'package:getx/controller/order_controller.dart';
import 'package:getx/widget/cart_items.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController=Get.put(CartController());
    var orderController=Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont)=> Column(
            children: [
              Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '₦${cartController.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      GetBuilder<OrderController>(
                          init: OrderController(),
                          builder: (context) {
                            return TextButton(
                                onPressed: () {
                                  orderController.addOrder(
                                      cartController.items.values.toList(),
                                      cartController.totalAmount);
                                  cartController.clear();
                                  Get.snackbar(
                                      "Orders",
                                      "Orders placed successfully",
                                      backgroundColor: Colors.green,
                                      snackPosition: SnackPosition.BOTTOM
                                  );
                                },
                                child: Text('ORDER NOW'));
                          })
                      
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                itemCount: cartController.items.length,
                  itemBuilder: (context,index)=>CartItem(
                    id:cartController.items.values.toList()[index].id,
                    price:cartController.items.values.toList()[index].productPrice,
                    quantity:cartController.items.values.toList()[index].productQuantity,
                    title:cartController.items.values.toList()[index].productTitle,
                    productId:cartController.items.keys.toList()[index],
                  )
              ))

            ],
          )
      ),
    );
  }
}
