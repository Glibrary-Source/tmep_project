import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:network_practice/controller/data_controller.dart';
import 'package:network_practice/global/global.dart';
import 'package:network_practice/model/product_model.dart';
import 'package:network_practice/pages/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text("http 요청예제"),
            backgroundColor: Colors.lightBlue,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdxLxrIJoGmvhP8tcqse3kbwrtLUF_AoKF_A&usqp=CAU', fit: BoxFit.cover,)
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Get.to(()=>SettingPage());
                  },
                )
              ],
            ),
          ),
          body: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  controller.getProductList();
                },
                child: Text("요청하기"),
              ),
              if (controller.productModel != null)
                Expanded(
                    child: ListView.builder(
                        itemCount:
                            controller.productModel?.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Image.network(
                                    controller.productModel?.products?[index]?.thumbnail ??
                                        "",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(controller.productModel?.products?[index]?.title ??
                                      ""),
                                ],
                              ));
                        }))
            ],
          ));
    });
  }
}
