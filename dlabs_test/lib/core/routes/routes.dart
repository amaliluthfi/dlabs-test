import 'package:dlabs_test/core/routes/routesName.dart';
import 'package:dlabs_test/module/addMovie/screens/addMovie.dart';
import 'package:dlabs_test/module/home/screens/homepage.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> all = [
    GetPage(name: RouteConstant.home, page: () => const Homepage()),
    GetPage(name: RouteConstant.addMovie, page: () => const AddMovie()),
  ];
}
