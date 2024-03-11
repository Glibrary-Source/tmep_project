import 'package:dangoing_project/vo/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homework1/detail_home_work_page.dart';

class ProductWidget extends StatelessWidget {

  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailHomeWorkPage(
                productName: product.name??"",
                imagePath: product.imagePath??"",
                price: "${product.price??""}",
              ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Column(
            children: [
              Image.asset(product.imagePath??""),
              SizedBox(
                height: 20,
              ),
              Text(product.name??""),
              Text("${product.price??""}")
            ],
          ),
        ),
      ),
    );
  }
}
