import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mypage")),
      body: Container(
        child: Column(
          children: [
            Text("내점수는?"),
            GetBuilder<UserController>(
              builder: (controller) {
                return Text(controller.userPoint.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
