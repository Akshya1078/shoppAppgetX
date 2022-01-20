import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx/controller/order_controller.dart';
import 'package:getx/widget/appdrawer.dart';

import 'order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderController=Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderController.orders.length,
          itemBuilder: (context,index)=>
              OrderItem(order: orderController.orders[index])
      ),

    );
  }
}
