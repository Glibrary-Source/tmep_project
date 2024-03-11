import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_practice/controller/data_controller.dart';
import 'package:network_practice/global/global.dart';
import 'package:network_practice/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  if(prefs.getInt("userAge")==null) {
    await prefs.setInt("userAge", 18);
    print("값이 없어서 새로 세팅완료!! ${prefs.getInt("userAge")}");
  } else {
    print("이미 있음!! ${prefs.get("userAge")}");
  }

  logger.t("Trace log");
  logger.d("Debug log");
  logger.i("Info log");
  logger.w("Warning log");
  logger.e("Error log", error: 'Test Error');
  logger.f("What a fatal log");


  Get.put(DataController());
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