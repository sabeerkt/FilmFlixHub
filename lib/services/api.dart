import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/cast_model.dart';
import 'package:movie/model/mov_model.dart';

class Api {
  final Dio dio = Dio();

  Future<List<Movie>> fetchData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final decodedData = (response.data['results'] as List)
            .map((mov) => Movie.fromJson(mov))
            .toList();
        print(decodedData);
        return decodedData;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<List<Movie>> getTrending() async => fetchData(Constants.trendingurl);

  Future<List<Movie>> getShow() async => fetchData(Constants.show);

  Future<List<Movie>> getAirtvshow() async => fetchData(Constants.airtvshow);

  Future<List<Movie>> getTopRatedTv() async =>
      fetchData(Constants.topratedTv);

  Future<List<Movie>> getPopullar() async => fetchData(Constants.popullar);

  Future<List<Movie>> getTopRated() async => fetchData(Constants.toprated);

  Future<List<Movie>> getUpcoming() async => fetchData(Constants.upcoming);

  Future<List<CastModel>> getCast({
    required String castUrl,
    required BuildContext context,
  }) async {
    try {
      final response = await dio.get(castUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey("cast")) {
          final List<dynamic> results = data["cast"];
          //itrete cast model pas sto result 
          return results.map((cast) => CastModel.fromJson(cast)).toList();
        } else {
          throw Exception('No "cast" key in response');
        }
      } else {
        // log("${response.statusCode}");
        // throw Exception('Error function - Status Code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // throw Exception(e);
      // Dialogs.showSnackbar(context, 'Failed in get cast');
      return [];
    }
  }

  Future<List<Movie>> searchMovie({required String searchUrl}) async {
    try {
      final response = await dio.get(searchUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> searchData = response.data;
        final List<dynamic> searchMovies = searchData["results"];
        return searchMovies.map((search) => Movie.fromJson(search)).toList();
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        return [];
      }
    } on DioError catch (e) {
      // Handle Dio errors, like network issues, timeouts, etc.
      print('Dio Error: ${e.message}');
      return [];
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
      return [];
    }
  }
}
