
import '../vo/product.dart';

class ProductModel {
  int? totalCount;
  List<Product>? data;

  ProductModel({this.totalCount, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];

    if(json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

}