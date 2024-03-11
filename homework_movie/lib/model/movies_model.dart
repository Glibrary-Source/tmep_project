import 'package:homework_movie/vo/dates.dart';

import '../vo/Movies.dart';

class MoviesModel {
  Dates? dates;
  int? page;
  List<Movies>? results;
  int? total_pages;
  int? total_results;

  MoviesModel({this.dates,
    this.page,
    this.results,
    this.total_pages,
    this.total_results
  });

  MoviesModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Movies>[];
      json['results'].forEach((v) {
        results!.add(new Movies.fromJson(v));
      });
    }
    total_pages = json['total_pages'];
    total_results = json['total_results'];
  }

}