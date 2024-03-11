import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_movie/component/drawer_list_tile_widget.dart';
import 'package:homework_movie/component/movie_category_widget.dart';
import 'package:homework_movie/component/movie_grid_item_widget.dart';
import 'package:homework_movie/controller/data_controller.dart';
import 'package:homework_movie/global/shared_preferences.dart';
import 'package:homework_movie/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  void initState() {
    super.initState();
    dataController.getMoviesList("now_playing", prefs.getString("MovieLanguage") ?? "en-US", 1);
    dataController.setTabState("now_playing");
  }

  DataController dataController = Get.find();

  String state = "now_playing";


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
              title: Text("영화 리스트"), backgroundColor: Colors.lightBlueAccent),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYqrmkLQ8itYLFnx-Zvh8fFVNs63WJ6_cZOQ&usqp=CAU',
                      fit: BoxFit.cover,
                    )),
                DrawerListTileWidget(
                    title: "Home",
                    icon: Icons.home,
                    onTap: () => {Get.back()}
                ),
                DrawerListTileWidget(
                    title: "Settings",
                    icon: Icons.settings,
                    onTap: () => {Get.to(()=>SettingsPage())}
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  MovieCategoryWidget(title: "현재 상영중", state: state, categoryName: "now_playing",onTap: () => {
                    state = "now_playing",
                    controller.setCurrentPage(1),
                    controller.setTabState(state),
                    controller.getMoviesList(state,prefs.getString("MovieLanguage") ?? "en-US", 1),
                    setState(() {})
                  }),
                  MovieCategoryWidget(title: "인기 영화", state: state, categoryName: "popular",onTap: () => {
                    state = "popular",
                    controller.setCurrentPage(1),
                    controller.setTabState(state),
                    controller.getMoviesList(state,prefs.getString("MovieLanguage") ?? "en-US", 1),
                    setState(() {})
                  }),
                  MovieCategoryWidget(title: "탑 영화", state: state, categoryName: "top_rated",onTap: () => {
                    state = "top_rated",
                    controller.setCurrentPage(1),
                    controller.setTabState(state),
                    controller.getMoviesList(state,prefs.getString("MovieLanguage") ?? "en-US", 1),
                    setState(() {})
                  }),
                  MovieCategoryWidget(title: "개봉전 영화", state: state, categoryName: "upcoming",onTap: () => {
                    state = "upcoming",
                    controller.setCurrentPage(1),
                    controller.setTabState(state),
                    controller.getMoviesList(state,prefs.getString("MovieLanguage") ?? "en-US", 1),
                    setState(() {})
                  }),
                ],
              ),
              if (controller.moviesModel != null)
                Expanded(
                    flex: 9,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 5 / 8),
                        itemCount: controller.moviesModel?.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          return MovieGridItemWidget(
                              imagePath: controller.moviesModel?.results?[index].posterPath??"",
                              rate: controller.moviesModel?.results?[index].popularity??0,
                              movieTitle: controller.moviesModel?.results?[index].title??""
                          );
                        })),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              controller.setCurrentPage(index);
                              controller.getMoviesList(
                                  state,
                                  prefs.getString("MovieLanguage") ?? "en-US",
                                  index+1);
                            },
                            child: Padding(
                              padding: EdgeInsetsDirectional.all(8),
                              child:
                              Text("${index + 1}",
                                style: TextStyle(color: controller.currentPage == index ? Colors.red : Colors.grey)),
                            ));
                      }))
            ],
          ));
    });
  }
}
