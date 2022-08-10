import 'package:dlabs_test/core/style/colors.dart';
import 'package:dlabs_test/module/addMovie/controllers/addMovieController.dart';
import 'package:dlabs_test/module/addMovie/widgets/movieCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMovie extends StatelessWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMovieController>(
        init: AddMovieController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.kCream,
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              title: const Text("Add Movie"),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "Title",
                      onChange: (value) {
                        controller.title = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "Description",
                      onChange: (value) {
                        controller.desc = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: controller.img,
                      label: "Add image",
                      readOnly: true,
                      onTap: () => controller.pickImage(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => controller.addMovie(),
                        child: Text("Add Movie"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
