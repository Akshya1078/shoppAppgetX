import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {


  final String title;
  final double price;
  final String image;
  final String description;

   ProductDetailsScreen({
     required this.title, required this.price, required this.image, required this.description
}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color:Color(0xffF6F6F6),
          child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)
                ),
                child: Image.network(this.image,
                fit: BoxFit.cover,),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Chip(label: Text("Price"+"₦" +this.price.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,),
                  SizedBox(height: 15,),
                  Text(""+this.description,
                  textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff403B58),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  )
                ],
              ),
            )

          ],
          ),
        ),
      ),

    );
  }
}
