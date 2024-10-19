import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/address_model.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());
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
        await LocalData().setToCache(
            key: kLastAddressId, value: '${json[ApiKey.data][ApiKey.id]}');
        kLastAddressIdValue = LocalData().getFromCache(key: kLastAddressId);
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

  List<AddressModel> addresses = [];
  void getAddresses() async {
    emit(GetAddressesLoading());
    try {
      var json = await API().get(
        url: EndPoints.addAddress,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        addresses = [];
        List<dynamic> data = json[ApiKey.data][ApiKey.data];
        for (var item in data) {
          addresses.add(AddressModel.fromJson(item));
        }
        emit(GetAddressesSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetAddressesFailure(
          message: message,
        ),
      );
    }
  }
}
