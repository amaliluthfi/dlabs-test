import 'package:dlabs_test/core/AppNetwork/AppNetwork.dart';
import 'package:dlabs_test/module/home/data/moviesModel.dart';

class HomepageNetwork {
  final _network = AppNetwork();

  Future<List<MovieList>> getMoviesNetwork({int? size, int? page}) async {
    try {
      var res = await _network.get("size=$size&page=$page");
      return List<MovieList>.from(res.map((x) => MovieList.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }
}
