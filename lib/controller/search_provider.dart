import 'package:flutter/material.dart';
import 'package:movie/model/mov_model.dart';
import 'package:movie/services/api.dart';


class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final Api service = Api();
  List<Movie> searchResults = [];
  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=aa9a8a205c0591e06a5292b3c1835f3a";
        List<Movie> movies =
            await service.searchMovie(searchurl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
