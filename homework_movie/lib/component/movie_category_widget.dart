import 'package:flutter/material.dart';

class MovieCategoryWidget extends StatefulWidget {

  String title;
  String state;
  String categoryName;
  VoidCallback? onTap;

  MovieCategoryWidget({super.key, required this.title, required this.state, required this.categoryName, this.onTap});

  @override
  State<MovieCategoryWidget> createState() => _MovieCategoryWidgetState();
}

class _MovieCategoryWidgetState extends State<MovieCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
          widget.state == widget.categoryName ? Colors.red : Colors.grey,
        ),
        child: Text(widget.title),
      ),
    );
  }
}
