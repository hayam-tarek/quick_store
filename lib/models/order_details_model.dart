import 'package:quick_store/models/address_model.dart';

class OrderDetailsModel {
  int id;
  int cost;
  int discount;
  double points;
  double vat;
  double total;
  int pointsCommission;
  String promoCode;
  String paymentMethod;
  String date;
  String status;
  AddressModel address;
  List<OrderProductModel> products;

  OrderDetailsModel({
    required this.id,
    required this.cost,
    required this.discount,
    required this.points,
    required this.vat,
    required this.total,
    required this.pointsCommission,
    required this.promoCode,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.address,
    required this.products,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"],
        cost: json["cost"],
        discount: json["discount"],
        points: json["points"]?.toDouble(),
        vat: json["vat"]?.toDouble(),
        total: json["total"]?.toDouble(),
        pointsCommission: json["points_commission"],
        promoCode: json["promo_code"],
        paymentMethod: json["payment_method"],
        date: json["date"],
        status: json["status"],
        address: AddressModel.fromJson(json["address"]),
        products: List<OrderProductModel>.from(
          json["products"].map((x) => OrderProductModel.fromJson(x)),
        ),
      );
}

class OrderProductModel {
  int id;
  int quantity;
  int price;
  String name;
  String image;

  OrderProductModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        id: json["id"],
        quantity: json["quantity"],
        price: json["price"],
        name: json["name"],
        image: json["image"],
      );
}
