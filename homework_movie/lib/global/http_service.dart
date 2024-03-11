import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:homework_movie/model/movies_model.dart';
import 'package:http/http.dart' as http;


class HttpService {

  Future<MoviesModel> getMoviesList(String type,String language, int page) async {
    String key = dotenv.env['movieKey']??"key";

    Map<String, String> headers = {
      "accept": 'application/json',
      "Authorization": 'Bearer $key'
    };

    String url = "https://api.themoviedb.org/3/movie/$type?language=$language&page=$page";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }
}