class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });
  factory CategoryModel.fromJSON({required Map<String, dynamic> json}) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
