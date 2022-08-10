import 'dart:io';

import 'package:dlabs_test/core/style/colors.dart';
import 'package:dlabs_test/module/addMovie/data/addMovieNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

class AddMovieController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  String title = "";
  String desc = "";
  TextEditingController img = TextEditingController();

  Future<void> addMovie() async {
    try {
      if (title != "" && desc != "") {
        await AddMovieNetwork()
            .addMoviesNetwork(title: title, desc: desc, img: img.text);
      } else {
        throw "title and description is required";
      }
    } catch (e) {
      if (e == "title and description is required") {
        Get.snackbar("Error", "title and description is required",
            backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Something went wrong",
            backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
      }
    }
  }

  Future<void> pickImage() async {
    try {
      XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

      img.text = picked!.path;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong",
          backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
    }
  }
}
