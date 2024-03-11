import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_practice/controller/user_controller.dart';

import 'my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    print(userController.userPoint);
  }

  int point = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text("Mainpage")),
        body: Column(
          children: [
            Container(
              child: Text(controller.userPoint.toString()),
            ),
            Container(
              child: Text("나의 포인트"),
            ),
            GestureDetector(
              onTap: () {
                controller.addUserPoint();
              },
              child: Text("포인트 올리기 버튼"),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MyPage());
              },
              child: Text("마이페이지로 넘어가기"),
            ),
          ],
        ),
      );
    });
  }
}
