import 'dart:convert';

import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';

import 'package:http/http.dart' as http;

class Api {
  Future<List<Movie>> getTrending() async {
    final response = await http.get(Uri.parse(Constants.trendingurl));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getshow() async {
    final response = await http.get(Uri.parse(Constants.show));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getairtvshow() async {
    final response = await http.get(Uri.parse(Constants.airtvshow));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> gettopratedTv() async {
    final response = await http.get(Uri.parse(Constants.topratedTv));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getpopullar() async {
    final response = await http.get(Uri.parse(Constants.popullar));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }

  Future<List<Movie>> getToprated() async {
    final response = await http.get(Uri.parse(Constants.toprated));
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
    final response = await http.get(Uri.parse(Constants.upcoming));
    if (response.statusCode == 200) {
      final decodedata = json.decode(response.body)['results'] as List;
      print(decodedata);
      return decodedata.map((mov) => Movie.fromJson(mov)).toList();
    } else {
      throw Exception("somthing happen");
    }
  }
}
