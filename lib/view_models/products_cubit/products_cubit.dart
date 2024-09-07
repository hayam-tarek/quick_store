import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(LayoutInitial());
  List<ProductModel> products = [];
  void getProducts() async {
    emit(GetProductsLoading());
    try {
      var json = await API().get(
        url: EndPoints.home,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> productsData = json[ApiKey.data][ApiKey.products];
        for (var item in productsData) {
          products.add(ProductModel.fromJson(item));
        }
        emit(GetProductsSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetProductsFailure(
          message: message,
        ),
      );
    }
  }

  List<ProductModel> filteredProducts = [];
  void filterProducts({required String query}) {
    if (query.isEmpty || query == '') {
      filteredProducts = [];
    } else {
      filteredProducts = products
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(GetProductsSuccess());
  }
}
