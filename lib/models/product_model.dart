class ProductModel {
  num id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;
  ProductModel({
    required this.description,
    required this.discount,
    required this.id,
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.price,
    this.images,
    this.inCart,
    this.inFavorites,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
