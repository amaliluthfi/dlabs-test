import 'package:cached_network_image/cached_network_image.dart';
import 'package:dlabs_test/module/home/data/moviesModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/customShimmer.dart';
import '../../../core/style/colors.dart';

class MovieCard extends StatelessWidget {
  MovieCard({Key? key, required this.data}) : super(key: key);
  final MovieList data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        width: MediaQuery.of(context).size.width / 1,
        color: AppColors.kCreamBright,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height * 0.15,
                imageUrl: data.poster ?? "",
                placeholder: (context, url) => Container(
                    color: AppColors.greyText3,
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: CustomShimmer(height: 60, width: 30),
                    )),
                errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade300,
                    child: const AspectRatio(
                      aspectRatio: 1 / 2,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "${data.title}",
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "${data.description}",
                    style: GoogleFonts.roboto(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "${data.createdDate!.day}/${data.createdDate!.month}${data.createdDate!.year}",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
