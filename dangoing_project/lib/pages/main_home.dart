import 'package:dangoing_project/pages/fruit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("MainTitle",
            style: TextStyle(fontSize: 25, color: Color(0xFFB71C1C)),),
        ),
        body: Container(
          color: Colors.yellow,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Text("헬로우 페이지의 바디 부분입니다", style: TextStyle(fontSize: 20, color: Colors.blue),),
              const Text("한줄 더 써보겠습니다.", style: TextStyle(fontSize: 20, color: Colors.black),),
              GestureDetector(
                onTap: () {
                  print("넘어갑니다");

                  Get.to(()=>const FruitPage());
                },
                child: const Text("다음페이지로 넘어가기", style: TextStyle(fontSize: 20, color: Colors.red),),
              )
            ],
          )
        )
    );
  }
}
