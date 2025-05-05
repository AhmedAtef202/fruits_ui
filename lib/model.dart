class CategoryModel {
  final String name;
  final String image;
  CategoryModel({required this.name, required this.image});
}

class ProductModel {
  final String name;
  final String image;
  final String rate;
  final String ratecount;
  final String price;
  ProductModel({
    required this.name,
    required this.image,
    required this.rate,
    required this.ratecount,
    required this.price,
  });
}
