import 'package:quick_store/models/product_model.dart';

class CartItemModel {
  int id;
  int quantity;
  ProductModel productModel;

  CartItemModel({
    required this.id,
    required this.quantity,
    required this.productModel,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      quantity: json['quantity'],
      productModel: ProductModel.fromJson(json['product']),
    );
  }
}
