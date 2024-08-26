class ProductModel {
  num id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;
  ProductModel({
    required this.description,
    required this.discount,
    required this.id,
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.price,
    required this.images,
    required this.inCart,
    required this.inFavorites,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
