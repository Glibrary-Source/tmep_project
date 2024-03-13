import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/controller/user_controller.dart';
import 'package:practice_firebase/pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  String email = "";
  String password = "";

  @override
  void dispose() {
    super.dispose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text("로그인하기"),
          backgroundColor: Colors.lightBlue,
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
            ElevatedButton(onPressed: () async {
              if (email == null ||
                  email == "" ||
                  password == null ||
                  password == ""
              ){
                print("똑바로 입력하세요");
              }else{
                try{
                  //모든 validation 확인이 끝난후 가능
                  await controller.login(email!, password!);
                  print("성공!");
                  Get.back();
                } catch(e){
                  print("에러");
                  print(e);
                }
              }
            }, child: Text("로그인")),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  Get.to(() => SignUpPage());
                },
                child: Text("회원가입 하러가기"))
          ],
        ),
      );
    });
  }
}
