import 'package:get/get.dart';

class UserController extends GetxController {

  int userPoint = 0;

  Future<void> addUserPoint() async {

    userPoint++;
    update();
  }

}