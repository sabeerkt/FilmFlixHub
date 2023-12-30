

class Movie {

  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  // double? movieLanguage;
  int? id;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    // required this.movieLanguage,
    
    });

    factory Movie.fromJson(Map<String,dynamic>json){
      return Movie(
        id: json['id']??'No Data',
        title: json["title"]??'No Data', 
        backDropPath: json["backdrop_path"]??'No Data', 
        originalTitle: json["original_title"]??'No Data', 
        overview: json["overview"]??'No Data', 
        posterPath: json["poster_path"]??'No Data', 
        releaseDate: json["release_date"]??'No Data', 
        // movieLanguage:  json['original_language']?? 'no data',
        voteAverage: json["vote_average"].toDouble()??'No Data',
        
        );
    }

}