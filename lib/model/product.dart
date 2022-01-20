

class Product{
  final int   id;
  final String productTitle;
  final String imageUrl;
  final String description;
  final double price;
  bool isFavourite;


Product({
  required this.id,
  required this.description,
  required this.imageUrl,
  this.isFavourite=false,
  required this.price,
  required this.productTitle});

}