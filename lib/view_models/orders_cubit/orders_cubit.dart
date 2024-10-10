import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  void addOrder({
    required num addressId,
    required num paymentMethod,
    required bool usePoints,
  }) async {
    emit(AddOrderLoading());
    try {
      var json = await API().post(
        url: EndPoints.addOrder,
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
}
