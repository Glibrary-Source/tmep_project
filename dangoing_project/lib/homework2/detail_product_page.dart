import 'package:flutter/material.dart';

import '../vo/product.dart';

class DetailProductPage extends StatefulWidget {

  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {

  bool favoriteState = false;
  late String welcomeText;

  @override
  void initState() {
    welcomeText = "헬로우";
    super.initState();
  }

  Future<String> getUserName() async {
    print('1');
    return "김사랑";
  }

  Future<String> getUserName2() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('2');
    });
    return "김수로";
  }

  Future<String> getUserName3() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("3");
    });
    return "김꺽정";
  }

  void printUserName() async {
    String ddd = await getUserName();
    getUserName2();
    getUserName3();
    print(ddd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name??""), centerTitle: true,),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              printUserName();
            },
            child: Text("테스트입니다"),
          ),
          Stack(
            children: [
              Image.network(widget.product.imagePath??""),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          favoriteState = !favoriteState;
                        });
                      },
                      child: Icon( favoriteState == false ? Icons.favorite_border_outlined : Icons.favorite, color: Colors.redAccent,)
                  )
              )
            ],
          ),
          Text(widget.product.name??""),
          SizedBox(height: 10,),
          Text("${widget.product.price??""}")
        ],
      )
    );
  }
}






















































































