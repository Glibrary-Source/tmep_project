import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/controller/post_controller.dart';
import 'package:practice_firebase/vo/postVo.dart';

class PostDetailPage extends StatefulWidget {
  final String docId;

  const PostDetailPage({super.key, required this.docId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostController postController = Get.find<PostController>();

  PostVo? post;

  @override
  void initState() {
    getDetailPost();

    super.initState();
  }

  void getDetailPost() async {
    post = await postController.getCommunityDetail(widget.docId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PostDetailPage")),
      body: post == null
          ? SizedBox()
          : Container(
              child: Column(
                children: [
                  Text(post?.title ?? ""),
                  Text(post?.contents ?? ""),
                  ElevatedButton(onPressed: () async{

                    await postController.updatePost(docId:post?.docId??"", contents: "apapapaap 이렇게수정");
                    await postController.getPostList();
                    Get.back();

                  }, child: Text("내용 수정하기")),
                  ElevatedButton(onPressed: () async{

                    await postController.deletePost(post!.docId!);
                    await postController.getPostList();
                    Get.back();

                  }, child: Text("문서 물리삭제")),
                ],
              ),
      ),
    );
  }
}
