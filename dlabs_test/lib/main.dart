import 'package:dlabs_test/core/style/colors.dart';
import 'package:dlabs_test/core/routes/routes.dart';
import 'package:dlabs_test/core/routes/routesName.dart';
import 'package:dlabs_test/module/home/controllers/homepageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomepageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConstant.home,
        getPages: AppRoute.all);
  }
}
