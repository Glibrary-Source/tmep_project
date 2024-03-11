import 'package:dangoing_project/homework2/detail_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homework1/detail_home_work_page.dart';
import '../vo/product.dart';

class ProductListWidget extends StatelessWidget {

  final Product product;

  const ProductListWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailProductPage(product: product));
        },
        child: Container(
          color: Colors.orangeAccent,
          margin: EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(product.imagePath??"", fit: BoxFit.cover,),
                )
              ),
              Column(
                children: [
                  Text(product.name??""),
                  SizedBox(height: 10,),
                  Text("${product.price??""}"),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
