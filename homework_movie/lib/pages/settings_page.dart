import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_movie/controller/data_controller.dart';
import 'package:homework_movie/global/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DataController dataController = Get.find();

  String languageState = prefs.getString("MovieLanguage")!;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("언어 선택"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    prefs.setString("MovieLanguage", "en-US");
                    languageState = "en-US";
                    controller.getMoviesList(
                        controller.moviesTapSelected!, languageState, 1);
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          languageState == "en-US" ? Colors.red : Colors.grey,
                    ),
                    child: Text("영어"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    prefs.setString("MovieLanguage", "ko-KR");
                    languageState = "ko-KR";
                    controller.getMoviesList(controller.moviesTapSelected!,
                        prefs.getString("MovieLanguage") ?? "en-US", 1);
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          languageState == "ko-KR" ? Colors.red : Colors.grey,
                    ),
                    child: Text("한국어"),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
