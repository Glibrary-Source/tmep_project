
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/post_list_model.dart';
import '../vo/postVo.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference post = firestore.collection('Post');

class SaranFirebaseService {

  ///Post
  // 포스트 리스트 조회
  Future<PostListModel> getPostList() async {

    try {
      QuerySnapshot querySnapshot = await post.where("isDeleted", isEqualTo: false).orderBy('createAt', descending: true).get();
      return PostListModel.fromQuerySnapshot(querySnapshot);
    } catch(error) {
      throw Exception(error);
    }
  }

  // 포스트 상세조회
  Future<PostVo> getPostDetail(String docId) async {

    try {
      DocumentSnapshot documentSnapshot = await post.doc(docId).get();
      return PostVo.fromDocumentSnapshot(documentSnapshot);
    } catch(error) {
      throw Exception(error);
    }
  }

  // 포스트 작성하기
  Future<void> writePost(PostVo userPost) async {

    try{

      ///add방식
      await post.add(userPost.toMap());

      ///set방식
      // 문서 참조를 만들고 자동으로 생성된 문서 ID를 가져옴
      // final DocumentReference docReference = post.doc();
      // userPost.docId = docReference.id;
      // await docReference.set(userPost.toMap()); <= 어차피 우리가 만든건 toMap 으로 변환해도 docId가 없어서 의미없음

    }catch(error){
      throw Exception("Error: $error");
    }
  }

  // 포스트 수정하기
  Future<void> updatePost({required String docId, required String contents}) async{
    try{
      await post.doc(docId).update({'contents': contents});
    }catch(error){
      throw Exception('Error: $error');
    }
  }

  // 포스트 삭제하기
  Future<void> deletePost(String docId) async{
    try{
      await post.doc(docId).delete();
    }catch(error){
      throw Exception("Error : $error");
    }
  }

  ///User
  /// 사용자 이메일 및 비밀번호로 기억
  Future<void> signUpWithEmailAndPassword(String userEmail, String userPassword) async {

  }
}