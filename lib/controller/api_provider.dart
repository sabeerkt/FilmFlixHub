import 'package:flutter/material.dart';
import 'package:movie/constant/api_key.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/services/api.dart';

class ApiProvider extends ChangeNotifier {
  Future<List<Movie>> getMOvies(String url) async {
    var movies = await Api().fetchData(url);
    notifyListeners();
    return movies;
  }
}
