import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_firebase/controller/post_controller.dart';
import 'package:practice_firebase/controller/user_controller.dart';
import 'package:practice_firebase/firebase_options.dart';

import 'package:practice_firebase/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/initial_shared_preference.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  prefs = await SharedPreferences.getInstance();

  Get.put(PostController());
  UserController userController = Get.put(UserController());


  await userController.autoLogin();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
