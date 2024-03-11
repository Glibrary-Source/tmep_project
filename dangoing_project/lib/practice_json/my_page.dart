import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../vo/user.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  User? myInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    String jsonString =
        await rootBundle.loadString('assets/json/user_json.json');

    Map<String, dynamic> mapData = json.decode(jsonString);
    User user = User.fromJson(mapData);
    setState(() {
      myInfo = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("마이페이지"),
        ),
        body: myInfo == null
            ? SizedBox()
            : Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      myInfo?.profileImagePath ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(myInfo?.name ?? ""),
                  Text("${myInfo?.age}세")
                ],
              ),
    );
  }

}
