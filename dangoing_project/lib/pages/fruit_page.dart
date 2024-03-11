import 'package:dangoing_project/pages/fruit_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FruitPage extends StatelessWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("과일 페이지 입니다"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => FruitDetailPage(
                    fruitName: "사과",
                    fruitImagePath: 'assets/images/apple.jpg',
                    price: 3000,
                  ));
            },
            child: const Text("사과"),
          ),
          AspectRatio(
            aspectRatio: 1 / 2,
            child: Image.asset(
              'assets/images/apple.jpg',
              width: 100,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => FruitDetailPage(
                    fruitName: "바나나",
                    fruitImagePath: 'assets/images/banana.jpg',
                    detail: "맛좋고 당도좋은 바나나",
                    price: 5000,
                  ));
            },
            child: const Text("바나나"),
          ),
          Image.asset(
            "assets/images/banana.jpg",
            width: 200,
          ),
          const Text("인터넷 이미지 가져오기"),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  "https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png",
                  width: 100,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  "https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png",
                  width: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
