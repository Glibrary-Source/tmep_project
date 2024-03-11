
import 'package:get/get.dart';
import 'package:homework_movie/global/http_service.dart';
import 'package:homework_movie/model/movies_model.dart';

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  MoviesModel? moviesModel;

  String? moviesTapSelected;
  int? currentPage;

  Future<bool> getMoviesList(String type,String language, int page) async {

    try {
      MoviesModel info = await httpService.getMoviesList(type,language,page);
      moviesModel = info;
      update();
      return true;

    } catch(error) {
      print(error);
      return false;
    }
  }

  Future<void> setTabState(String state) async {
    moviesTapSelected = state;
  }

  Future<String> getTabState() async {
    return moviesTapSelected??"now_playing";
  }

  Future<void> setCurrentPage(int page) async {
    currentPage = page;
  }

  Future<int> getCurrentPage() async {
    return currentPage??1;
  }

}