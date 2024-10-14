class OrderModel {
  final int id;
  final double total;
  final String date;
  final String status;

  OrderModel({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        total: json["total"]?.toDouble(),
        date: json["date"],
        status: json["status"],
      );
}
