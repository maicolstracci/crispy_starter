import 'package:crispy_starter/Models/data_models.dart';
import 'package:crispy_starter/api_keys.dart';
import 'package:dio/dio.dart';

class NetworkingService {

  List<String> _imdbEndpoint = [
    "Top250Movies",
    "Top250TVs",
    "MostPopularMovies",
    "MostPopularTVs"
  ];

  List<String> get imdbEndPoint => _imdbEndpoint;

  Future<List<Movie>> requestInfo({String endPoint}) async {

    try {
      Response response = await Dio()
          .get("https://imdb-api.com/en/API/$endPoint/$kImdbApiKey");

      MovieData movieData = MovieData.fromJson(response.data);

      return movieData.movies;
    } catch (e) {
      print(e);
      return null;
    }
  }


}