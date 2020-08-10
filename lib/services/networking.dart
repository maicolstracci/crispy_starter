import 'package:crispy_starter/Models/data_models.dart';

class NetworkingService {
  List<String> _imdbEndpoint = [
    "Top250Movies",
    "Top250TVs",
    "MostPopularMovies",
    "MostPopularTVs"
  ];

  List<String> get imdbEndPoint => _imdbEndpoint;

  Future<List<Movie>> getInfo({String endPoint}) async {
    try {
//      Response response = await Dio()
//          .get("https://imdb-api.com/en/API/$endPoint/$kImdbApiKey");

      //Lo so che e' bruttissimo da fare ma volevo una cosa veloce veloce
      MovieData movieData = MovieData.fromJson({
        "items": [
          {
            "id": "tt0111161",
            "rank": "1",
            "title": "The Shawshank Redemption",
            "fullTitle": "The Shawshank Redemption (1994)",
            "year": "1994",
            "image":
                "https://imdb-api.com/images/original/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
            "imDbRating": "9.2",
            "imDbRatingCount": "2270131"
          },
          {
            "id": "tt0068646",
            "rank": "2",
            "title": "The Godfather",
            "fullTitle": "The Godfather (1972)",
            "year": "1972",
            "image":
                "https://imdb-api.com/images/original/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_Ratio0.7015_AL_.jpg",
            "crew": "Francis Ford Coppola (dir.), Marlon Brando, Al Pacino",
            "imDbRating": "9.1",
            "imDbRatingCount": "1565866"
          },
          {
            "id": "tt0071562",
            "rank": "3",
            "title": "The Godfather: Part II",
            "fullTitle": "The Godfather: Part II (1974)",
            "year": "1974",
            "image":
                "https://imdb-api.com/images/original/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_Ratio0.7015_AL_.jpg",
            "crew": "Francis Ford Coppola (dir.), Al Pacino, Robert De Niro",
            "imDbRating": "9.0",
            "imDbRatingCount": "1094237"
          },
          {
            "id": "tt0468569",
            "rank": "4",
            "title": "The Dark Knight",
            "fullTitle": "The Dark Knight (2008)",
            "year": "2008",
            "image":
                "https://imdb-api.com/images/original/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Christopher Nolan (dir.), Christian Bale, Heath Ledger",
            "imDbRating": "9.0",
            "imDbRatingCount": "2233166"
          },
          {
            "id": "tt0050083",
            "rank": "5",
            "title": "12 Angry Men",
            "fullTitle": "12 Angry Men (1957)",
            "year": "1957",
            "image":
                "https://imdb-api.com/images/original/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Sidney Lumet (dir.), Henry Fonda, Lee J. Cobb",
            "imDbRating": "8.9",
            "imDbRatingCount": "665359"
          },
          {
            "id": "tt0108052",
            "rank": "6",
            "title": "Schindler's List",
            "fullTitle": "Schindler's List (1993)",
            "year": "1993",
            "image":
                "https://imdb-api.com/images/original/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Steven Spielberg (dir.), Liam Neeson, Ralph Fiennes",
            "imDbRating": "8.9",
            "imDbRatingCount": "1178771"
          },
          {
            "id": "tt0167260",
            "rank": "7",
            "title": "The Lord of the Rings: The Return of the King",
            "fullTitle": "The Lord of the Rings: The Return of the King (2003)",
            "year": "2003",
            "image":
                "https://imdb-api.com/images/original/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Peter Jackson (dir.), Elijah Wood, Viggo Mortensen",
            "imDbRating": "8.9",
            "imDbRatingCount": "1599176"
          },
          {
            "id": "tt0110912",
            "rank": "8",
            "title": "Pulp Fiction",
            "fullTitle": "Pulp Fiction (1994)",
            "year": "1994",
            "image":
                "https://imdb-api.com/images/original/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Quentin Tarantino (dir.), John Travolta, Uma Thurman",
            "imDbRating": "8.8",
            "imDbRatingCount": "1774094"
          },
          {
            "id": "tt0060196",
            "rank": "9",
            "title": "The Good, the Bad and the Ugly",
            "fullTitle": "The Good, the Bad and the Ugly (1966)",
            "year": "1966",
            "image":
                "https://imdb-api.com/images/original/MV5BOTQ5NDI3MTI4MF5BMl5BanBnXkFtZTgwNDQ4ODE5MDE@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Sergio Leone (dir.), Clint Eastwood, Eli Wallach",
            "imDbRating": "8.8",
            "imDbRatingCount": "669956"
          },
          {
            "id": "tt0120737",
            "rank": "10",
            "title": "The Lord of the Rings: The Fellowship of the Ring",
            "fullTitle":
                "The Lord of the Rings: The Fellowship of the Ring (2001)",
            "year": "2001",
            "image":
                "https://imdb-api.com/images/original/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_Ratio0.6716_AL_.jpg",
            "crew": "Peter Jackson (dir.), Elijah Wood, Ian McKellen",
            "imDbRating": "8.8",
            "imDbRatingCount": "1614759"
          },
          {
            "id": "tt0137523",
            "rank": "11",
            "title": "Fight Club",
            "fullTitle": "Fight Club (1999)",
            "year": "1999",
            "image":
                "https://imdb-api.com/images/original/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_Ratio0.6716_AL_.jpg",
            "crew": "David Fincher (dir.), Brad Pitt, Edward Norton",
            "imDbRating": "8.8",
            "imDbRatingCount": "1801200"
          },
        ]
      });

      return movieData.movies;
    } catch (e) {
      print(e);
      return null;
    }
  }
}