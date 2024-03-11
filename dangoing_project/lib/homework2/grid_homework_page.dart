import 'dart:convert';

import 'package:dangoing_project/component/product_grid_widget.dart';
import 'package:dangoing_project/component/product_list_widget.dart';
import 'package:dangoing_project/model/product_model.dart';
import 'package:dangoing_project/practice_json/my_page.dart';
import 'package:dangoing_project/vo/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GridHomeworkPage extends StatefulWidget {
  const GridHomeworkPage({super.key});

  @override
  State<GridHomeworkPage> createState() => _GridHomeworkPageState();
}

class _GridHomeworkPageState extends State<GridHomeworkPage> {
  ProductModel? productModel;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    String jsonString =
        await rootBundle.loadString('assets/json/product_json.json');

    Map<String, dynamic> mapData = json.decode(jsonString);
    ProductModel model = ProductModel.fromJson(mapData);
    setState(() {
      productModel = model;
    });
  }

  String viewState = "Grid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("싱싱마을"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => MyPage());
            },
            child: Center(
              child: Text("마이페이지"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      viewState = "Grid";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: viewState == "Grid" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(right: 16),
                    child: Text(
                      "그리드뷰",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      viewState = "List";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: viewState == "List" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(right: 16),
                    child: Text(
                      "리스트뷰",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (viewState == "Grid")
            Expanded(
                child: (productModel == null || productModel?.data == null)
                    ? SizedBox()
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: productModel!.data!.length,
                        itemBuilder: (context, index) {
                          return ProductGridWidget(
                              product: productModel!.data![index]);
                        })),
          if (viewState == "List")
            Expanded(
                child: (productModel == null || productModel?.data == null)
                    ? SizedBox()
                    : ListView.builder(
                        itemCount: productModel!.data!.length,
                        itemBuilder: (context, index) {
                          return ProductListWidget(
                              product: productModel!.data![index]);
                        }))
        ],
      ),
    );
  }
}
