import 'dart:io';

import 'package:get/get.dart';
import 'package:network_practice/global/http_service.dart';

import '../model/product_model.dart';

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  ProductModel? productModel;

  Future<bool> getProductList() async {

    try {
      ProductModel info = await httpService.getProductList();
      productModel = info;
      update();
      return true;

    } catch(error) {
      print(error);
      return false;
    }


  }

}