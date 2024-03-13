import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController passwordConfirmInputController =
      TextEditingController();
  String email = "";
  String password = "";
  String passwordConfirm = "";

  @override
  void dispose() {
    super.dispose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text("회원가입하기"),
        ),
        body: Column(
          children: [
            Text("로그인"),
            SizedBox(
              height: 20,
            ),
            Text("이메일"),
            TextField(
              controller: emailInputController,
              decoration: InputDecoration(hintText: "이메일을 입력해주세요"),
              onChanged: (value) {
                email = value;
              },
            ),
            Text("비밀번호"),
            TextField(
              controller: passwordInputController,
              decoration: InputDecoration(hintText: "비밀번호를 입력해주세요"),
              onChanged: (value) {
                password = value;
              },
            ),
            Text("비밀번호 확인"),
            TextField(
              controller: passwordConfirmInputController,
              decoration: InputDecoration(hintText: "비밀번호를 한번더 입력해주세요"),
              onChanged: (value) {
                passwordConfirm = value;
              },
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (email == null ||
                      email == "" ||
                      password == null ||
                      password == "" ||
                      passwordConfirm == null ||
                      passwordConfirm == "") {
                    print("똑바로 입력하세요");
                  } else {
                    if (password != passwordConfirm) {
                      print("비밀번호를 확인하세요");
                    } else {
                      try{
                        // 모든 validation 확인이 끝난후 가능
                        await controller.addUser(email!, password!);
                        print("성공!");
                        Get.back();
                      }catch(e){
                        print(e);
                      }
                    }
                  }
                },
                child: Text("회원가입"))
          ],
        ),
      );
    });
  }
}
