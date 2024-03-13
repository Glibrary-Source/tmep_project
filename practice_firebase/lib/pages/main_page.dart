import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/component/drawer_list_tile_widget.dart';
import 'package:practice_firebase/controller/post_controller.dart';
import 'package:practice_firebase/controller/user_controller.dart';
import 'package:practice_firebase/pages/sign_in_page.dart';
import 'package:practice_firebase/pages/sign_up_page.dart';

import 'my_page.dart';
import 'post_detail_page.dart';
import 'write_post_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PostController postController = Get.find<PostController>();

  @override
  void initState() {
    super.initState();
    postController.getPostList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text("MainTitle"),),
        drawer: GetBuilder<UserController>(builder: (controller2){
          return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYqrmkLQ8itYLFnx-Zvh8fFVNs63WJ6_cZOQ&usqp=CAU',
                        fit: BoxFit.cover,
                      )),
                  if(controller2.myInfo==null)
                    DrawerListTileWidget(
                      title: "로그인",
                      icon: Icons.login,
                      onTap: () => {Get.to(()=>SignInPage())},
                    ),
                  if(controller2.myInfo!=null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller2.myInfo?.email??""),
                        DrawerListTileWidget(
                          title: "마이페이지",
                          icon: Icons.man,
                          onTap: ()=>{
                            Get.to(()=>MyPage())
                          },
                        ),
                        DrawerListTileWidget(
                          title: "로그아웃",
                          icon: Icons.logout,
                          onTap: ()=>{
                            controller2.logout()
                          },
                        )
                      ],
                    )
                ],
              )
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: (){
            Get.to(()=>WritePostPage());
          },
        ),
        body: controller.postList == null
            ? SizedBox()
            : ListView.builder(
                itemCount: controller.postList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>PostDetailPage(docId: controller!.postList[index]!.docId!));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Text(controller!.postList[index]!.title!),
                          Text(controller!.postList[index]!.contents!)
                        ],
                      ),
                    ),
                  );
                }),
      );
    });
  }
}
