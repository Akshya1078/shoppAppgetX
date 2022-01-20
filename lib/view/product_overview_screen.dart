import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/cart_controller.dart';
import 'package:getx/view/productgrid.dart';
import 'package:getx/widget/appdrawer.dart';
import 'package:getx/widget/badge.dart';

import 'cart_screen.dart';

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartController=Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(()=>CartScreen());
            },
            child: GetBuilder<CartController>(
              init: CartController(),
                builder: (context){
                  return Badge(
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                        ),
                        onPressed: () {
                          Get.to(()=>CartScreen());
                        }),
                    value: cartController.itemCount.toString(),
                    color: Colors.red,
                  );
                }


            ),
          ),

        ]

      ),
      drawer: AppDrawer(),
      body: ProductGrid(),
    );
  }
}
