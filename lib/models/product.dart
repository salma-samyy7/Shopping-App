class Product {
  final String id;
  final String title;
  final String image; // can be an asset path or URL
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
}
