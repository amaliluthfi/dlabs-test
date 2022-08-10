import 'dart:io';

import 'package:dlabs_test/core/AppNetwork/AppNetwork.dart';

class AddMovieNetwork {
  final _network = AppNetwork();

  Future<void> addMoviesNetwork(
      {String? title, String? desc, String? img}) async {
    try {
      final body = {title: title, desc: desc, img: img};
      print("ini title $title dan $desc dan $body");

      await _network.post("", body: body);
      // return List<MovieList>.from(res.map((x) => MovieList.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }
}
