import 'package:dangoing_project/component/ProductWidget.dart';
import 'package:dangoing_project/pages/fruit_list_page.dart';
import 'package:dangoing_project/practice_json/my_page.dart';
import 'package:dangoing_project/pages/store_list_page.dart';
import 'package:dangoing_project/vo/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/member_list_page.dart';

class HomeWork extends StatelessWidget {
  HomeWork({super.key});

  Product product1 = Product(
    name: "의자",
    imagePath: "assets/images/refrigerator.jpg",
    price: 3000
  );
  Product product2 = Product(
      name: "냉장고",
      imagePath: "assets/images/refrigerator.jpg",
      price: 4000
  );
  Product product3 = Product(
      name: "자동차",
      imagePath: "assets/images/refrigerator.jpg",
      price: 5000
  );
  Product product4 = Product(
      name: "에어컨",
      imagePath: "assets/images/refrigerator.jpg",
      price: 6000
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "사무실쇼핑몰",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              ProductWidget(product: product1),
              ProductWidget(product: product2),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              ProductWidget(product: product3),
              ProductWidget(product: product4),
            ],
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              Get.to(()=>MemberListPage());
            },
            child: const Text("회원목록 보러가기"),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=>StoreListPage());
            },
            child: const Text("매장목록 보러가기"),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=>const MyPage());
            },
            child: const Text("마이페이지"),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=>const FruitListPage());
            },
            child: const Text("마이페이지"),
          ),
        ],
      ),
    );
  }
}
