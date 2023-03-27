class ProductModel {
  final String name;
  final String imageUrl;
  final String price;
  final String description;
  final String location;
  bool isFavorite;

  ProductModel({
    required this.description,
    required this.location,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}
