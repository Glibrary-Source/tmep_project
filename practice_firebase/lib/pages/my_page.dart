import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_firebase/controller/user_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text("마이페이지"),),
        body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    controller.myInfo?.imagePath ?? "", fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                          Icons.face
                      ); // 이미지로드 오류 시 대체 이미지
                    },
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: () async {
                //1. 이미지 피커로 사진받기
                XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                //2. XFile -> File로 변환
                if (xFile != null) {
                  File file = File(xFile.path);

                  //3. 컨트롤러 메소드 호출
                  try{
                    controller.editProfileImage(file);
                  }catch(e) {
                    print("에러낫슈");
                  }
                }
              }, child: Text("사진올리기")),
              SizedBox(height: 50,),
              Container(
                child: Text(controller.myInfo?.email ?? ""),
              ),
            ],
          ),
        ),
      );
    });
  }
}
