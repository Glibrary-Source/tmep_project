import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/controller/post_controller.dart';

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
