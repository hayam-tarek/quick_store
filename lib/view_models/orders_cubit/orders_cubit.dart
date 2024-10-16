import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_details_model.dart';
import 'package:quick_store/models/order_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  num? paymentMethod;
  void addOrder({
    required String addressId,
    required String paymentMethod,
    required String usePoints,
  }) async {
    emit(AddOrderLoading());
    try {
      var json = await API().post(
        url: EndPoints.orders,
        body: {
          ApiKey.addressId: addressId,
          ApiKey.paymentMethod: paymentMethod,
          ApiKey.usePoints: usePoints,
        },
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        emit(AddOrderSuccess(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        AddOrderFailure(
          message: message,
        ),
      );
    }
  }

  List<OrderModel> orders = [];
  void getOrders() async {
    emit(GetOrdersLoading());
    try {
      var json = await API().get(
        url: EndPoints.orders,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        orders = [];
        List<dynamic> data = json[ApiKey.data][ApiKey.data];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        emit(GetOrdersSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetOrdersFailure(
          message: message,
        ),
      );
    }
  }

  void cancelOrder({required num orderId}) async {
    emit(CancelOrderLoading());
    try {
      var json = await API().get(
        url: EndPoints.cancelOrder(id: orderId),
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        emit(CancelOrderSuccess(message: json[ApiKey.message]));
        getOrders();
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        CancelOrderFailure(
          message: message,
        ),
      );
    }
  }

  OrderDetailsModel? orderDetailsModel;
  void getOrderDetails({required num orderID}) async {
    emit(GetOrderDetailsLoading());
    try {
      var json = await API().get(
        url: EndPoints.orderDetails(id: orderID),
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        orderDetailsModel = OrderDetailsModel.fromJson(json[ApiKey.data]);
        emit(GetOrderDetailsSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetOrderDetailsFailure(
          message: message,
        ),
      );
    }
  }
}
