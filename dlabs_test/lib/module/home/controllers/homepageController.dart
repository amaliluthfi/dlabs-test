import 'package:dlabs_test/core/style/colors.dart';
import 'package:dlabs_test/module/home/data/homepage_network.dart';
import 'package:dlabs_test/module/home/data/moviesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  List<MovieList> movieList = [];
  bool isLoading = false;
  bool isLoadingLoadMore = false;
  bool isEnd = false;
  int size = 10;
  int page = 1;

  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  Future<void> getMovies() async {
    isLoading = true;
    movieList = [];
    isEnd = false;
    page = 1;
    update();
    try {
      var res = await HomepageNetwork().getMoviesNetwork(size: 10, page: page);
      movieList = res;
      page++;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong",
          backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
    }
    isLoading = false;
    update();
  }

  Future<void> loadMoreMovies() async {
    if (!isLoadingLoadMore && !isEnd) {
      isLoadingLoadMore = true;
      update();
      try {
        var res =
            await HomepageNetwork().getMoviesNetwork(size: size, page: page);
        if (res.isNotEmpty) {
          movieList.addAll(res);
        } else {
          isEnd = true;
        }
        page++;
      } catch (e) {
        Get.snackbar("Error", "Something went wrong",
            backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
      }
      isLoadingLoadMore = false;
    }
    update();
  }
}
