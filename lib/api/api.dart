import 'dart:convert';

import 'package:movie/model/mov_model.dart';
import 'package:movie/model/mov_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const toprated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=aa9a8a205c0591e06a5292b3c1835f3a';

  static const trendingurl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=aa9a8a205c0591e06a5292b3c1835f3a';

  static const upcoming =
      'https://api.themoviedb.org/3/discover/movie?primary_release_year=2024&api_key=aa9a8a205c0591e06a5292b3c1835f3a';

  Future<List<Movie>> getTrending() async {
    final response = await http.get(Uri.parse(trendingurl));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getToprated() async {
    final response = await http.get(Uri.parse(toprated));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getUpcoming() async {
    final response = await http.get(Uri.parse(upcoming));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }
}
