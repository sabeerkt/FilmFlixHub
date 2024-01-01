import 'package:dio/dio.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';

class Api {
  Dio dio = Dio();

  Future<List<Movie>> fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final decodedata = response.data['results'] as List;
        print(decodedata);
        return decodedata.map((mov) => Movie.fromJson(mov)).toList();
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<List<Movie>> getTrending() async {
    return fetchData(Constants.trendingurl);
  }

  Future<List<Movie>> getshow() async {
    return fetchData(Constants.show);
  }

  Future<List<Movie>> getairtvshow() async {
    return fetchData(Constants.airtvshow);
  }

  Future<List<Movie>> gettopratedTv() async {
    return fetchData(Constants.topratedTv);
  }

  Future<List<Movie>> getpopullar() async {
    return fetchData(Constants.popullar);
  }

  Future<List<Movie>> getToprated() async {
    return fetchData(Constants.toprated);
  }

  Future<List<Movie>> getUpcoming() async {
    return fetchData(Constants.upcoming);
  }
   Future<List<Movie>> searchMovie({required searchurl}) async {
    try {
      final response = await dio.get(searchurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> searchdata = response.data;
        final List<dynamic> searchmovies = searchdata["results"];
        return searchmovies
            .map((search) => Movie.fromJson(search))
            .toList();
      } else {
        print('function error');
        return [];
      }
    } catch (e) {
      print("unable to fetch data:-${e}");
      return [];
    }
  }
}
