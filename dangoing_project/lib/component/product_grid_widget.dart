import 'package:dangoing_project/homework2/detail_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homework1/detail_home_work_page.dart';
import '../vo/product.dart';

class ProductGridWidget extends StatelessWidget {
  final Product product;

  const ProductGridWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>DetailProductPage(product: product));
      },
      child: Container(
        color: Colors.orange,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.network(product.imagePath??"",fit: BoxFit.cover,)
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("${product.price} 원")),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("${product.name}")),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
