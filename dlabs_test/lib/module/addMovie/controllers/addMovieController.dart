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
        print("ini title $title dan $desc");
        await AddMovieNetwork()
            .addMoviesNetwork(title: title, desc: desc, img: img.text);
      } else {
        throw "All must be filled";
      }
    } catch (e) {
      if (e == "All must be filled") {
        Get.snackbar("Error", "All must be filled",
            backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Something went wrong",
            backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
      }
    }
  }

  Future<void> pickImage() async {
    try {
      // String tempPath = tempDir.path;
      XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

      img.text = picked!.path;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong",
          backgroundColor: AppColors.kErrorColor, colorText: Colors.white);
    }
  }
}
