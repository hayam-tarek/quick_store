import 'package:quick_store/models/product_model.dart';

class CartModel {
  int id;
  int quantity;
  ProductModel productModel;

  CartModel({
    required this.id,
    required this.quantity,
    required this.productModel,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      productModel: ProductModel.fromJson(json['product']),
    );
  }
}
