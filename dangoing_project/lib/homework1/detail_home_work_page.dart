import 'package:flutter/material.dart';

class DetailHomeWorkPage extends StatelessWidget {

  String productName;
  String imagePath;
  String price;

  DetailHomeWorkPage({super.key, required this.productName, required this.imagePath, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$productName 상세페이지"),),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            children: [
              Text(productName),
              const SizedBox(height: 50,),
              Image.asset(imagePath, height: 400,),
              const SizedBox(height: 50,),
              Text(price),
              const SizedBox(height: 20,),
              const Text("구매자 목록"),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Colors.black)
                    ),

                    child: const Center(child: Text("김철수"),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Colors.black)
                    ),

                    child: const Center(child: Text("김영희"),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Colors.black)
                    ),

                    child: const Center(child: Text("고준희"),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Colors.black)
                    ),

                    child: const Center(child: Text("김건희"),),
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
