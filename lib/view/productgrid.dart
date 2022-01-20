import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx/controller/cart_controller.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/view/product_details_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductController());
    final cartController=Get.put(CartController());
    return GridView.builder(
      padding: EdgeInsets.all(10),
        itemCount: controller.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemBuilder:(context,index){
        return GetBuilder(
          init: ProductController(),
            builder: (value)=>ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: (){
                    Get.to(ProductDetailsScreen(
                     title: controller.items[index].productTitle,
                      price: controller.items[index].price,
                     image: controller.items[index].imageUrl,
                        description: controller.items[index].description
                    ));
                  },
                  child: Image.network(controller.items[index].imageUrl,
                  fit: BoxFit.cover,),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  leading: IconButton(
                    icon: Icon(
                      controller.items[index].isFavourite==true
                          ?Icons.favorite
                          :Icons.favorite_border,
                          color: Theme.of(context).accentColor,
                    ),
                    onPressed: (){
                      controller.togglFavouriteStatus(index);
                    },
                  ),
                  title: Text(
                    controller.items[index].productTitle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont){
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: (){
                          cartController.addItem(
                              controller.items[index].id,
                              controller.items[index].price,
                              controller.items[index].productTitle,
                            1);
                        },
                        color: Theme.of(context).accentColor,
                      );
                    },
                  ),
                ),
              ),
            )
        );
        }
    );
  }
}
