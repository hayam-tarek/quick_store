class UserDataModel {
  final String name;
  final String phone;
  final String email;
  final String id;
  final String image;
  final String token;

  UserDataModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });
  factory UserDataModel.fromJSON(json) {
    return UserDataModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        id: json['id'],
        image: json['image'],
        token: json['token']);
  }
}
