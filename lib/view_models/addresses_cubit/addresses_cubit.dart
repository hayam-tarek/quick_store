import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());
  int? lastAddedAddressId;
  void addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
    required String lat,
    required String lng,
  }) async {
    emit(AddAddressLoading());
    try {
      var json = await API().post(
        url: EndPoints.addAddress,
        body: {
          ApiKey.name: name,
          ApiKey.city: city,
          ApiKey.region: region,
          ApiKey.details: details,
          ApiKey.notes: notes,
          ApiKey.lat: lat,
          ApiKey.lng: lng,
        },
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        lastAddedAddressId = json[ApiKey.data][ApiKey.id];
        emit(AddAddressSuccess(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        AddAddressFailure(
          message: message,
        ),
      );
    }
  }
}
