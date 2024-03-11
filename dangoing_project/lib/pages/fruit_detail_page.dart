import 'package:flutter/material.dart';

class FruitDetailPage extends StatelessWidget {

  String fruitName;
  String fruitImagePath;
  String? detail;
  int price;

  FruitDetailPage({super.key, required this.fruitName, required this.fruitImagePath,this.detail, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$fruitName페이지"),),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(38.5),
              border: Border.all(color: Colors.black, width: 3)
            ),

            child: Image.asset(fruitImagePath),
          ),
          Text(detail??""),
          Text("$price", style: const TextStyle(fontSize: 30, color: Colors.green),)
        ],
      ),
    );
  }
}
