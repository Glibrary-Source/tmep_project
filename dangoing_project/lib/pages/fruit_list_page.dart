import 'package:flutter/material.dart';

class FruitListPage extends StatefulWidget {
  const FruitListPage({super.key});

  @override
  State<FruitListPage> createState() => _FruitListPageState();
}

class _FruitListPageState extends State<FruitListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("싱싱마을"),centerTitle: true,),
    );
  }
}
