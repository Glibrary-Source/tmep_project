import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/controller/post_controller.dart';
import 'package:practice_firebase/vo/postVo.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({super.key});

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {

  TextEditingController titleInputController = TextEditingController();
  TextEditingController contentsInputController = TextEditingController();
  String title="";
  String contents="";

  PostController postController = Get.find<PostController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleInputController.dispose();
    contentsInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WritePostPage")),
      body: Container(
        child: Column(
          children: [
            Text("제목"),
            TextField(
              controller: titleInputController,
              decoration: InputDecoration(
                hintText: "제목을 입력해주세요"
              ),
              onChanged: (value){
                title = value;
              },
            ),
            Text("내용"),
            TextField(
              controller: contentsInputController,
              decoration: InputDecoration(
                hintText: "내용을 입력해주세요"
              ),
              onChanged: (value){
                setState(() {
                  contents = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async{
                  PostVo userPost = PostVo();
                  userPost.writerId = "sdfsdf";
                  userPost.title = title;
                  userPost.contents = contents;
                  await postController.writePost(userPost);
                  await postController.getPostList();
                  Get.back();
                },
                child: Text("글쓰기"))
          ],
        ),
      ),
    );
  }
}
