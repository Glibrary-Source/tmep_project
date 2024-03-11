import 'package:flutter/material.dart';

class StoreListPage extends StatelessWidget {
  StoreListPage({super.key});

  final List<String> storeList = ['여의도점', '김포점', '부산서면점'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대상목록 페이지"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 5 / 4,
        ),
        itemCount: storeList.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.orangeAccent,
                child: Center(
                  child: Text(storeList[index]),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    height: 20,
                    color: Colors.red,
                    child: Center(
                      child: Text(storeList[index]),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
