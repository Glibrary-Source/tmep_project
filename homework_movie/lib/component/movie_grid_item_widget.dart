import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieGridItemWidget extends StatefulWidget {

  String imagePath;
  double rate;
  String movieTitle;

  MovieGridItemWidget({super.key, required this.imagePath, required this.rate, required this.movieTitle});

  @override
  State<MovieGridItemWidget> createState() => _MovieGridItemWidgetState();
}

class _MovieGridItemWidgetState extends State<MovieGridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.all(8),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${widget.imagePath}",
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/noImage.jpg");
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text("평점: ${widget.rate}"),
              ],
            ),
            Text(widget.movieTitle)
          ],
        ));
  }
}
