import 'package:dlabs_test/core/routes/routesName.dart';
import 'package:dlabs_test/core/style/colors.dart';
import 'package:dlabs_test/module/home/controllers/homepageController.dart';
import 'package:dlabs_test/module/home/widgets/movieCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/customShimmer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    if (_scrollController.position.extentAfter == 0) {
      Get.find<HomepageController>().loadMoreMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
        init: HomepageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.kCream,
            appBar: AppBar(
              title: const Text("Movies"),
              backgroundColor: AppColors.kPrimaryColor,
            ),
            body: RefreshIndicator(
              onRefresh: () => controller.getMovies(),
              child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  shrinkWrap: true,
                  itemCount: controller.movieList.length,
                  itemBuilder: (context, index) {
                    return !controller.isLoading
                        ? MovieCard(data: controller.movieList[index])
                        : CustomShimmer(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1);
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.kPrimaryColor,
              onPressed: () => Get.toNamed(RouteConstant.addMovie),
              tooltip: 'Add Movie',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
