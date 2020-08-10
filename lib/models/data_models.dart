class MovieData {
  List<Movie> movies;
  String errorMessage;

  MovieData({this.movies, this.errorMessage});

  MovieData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      movies = List<Movie>();
      json['items'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.movies != null) {
      data['items'] = this.movies.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class Movie {
  String id;
  String rank;
  String title;
  String fullTitle;
  String year;
  String image;
  String crew;
  String imDbRating;
  String imDbRatingCount;

  Movie(
      {this.id,
        this.rank,
        this.title,
        this.fullTitle,
        this.year,
        this.image,
        this.crew,
        this.imDbRating,
        this.imDbRatingCount});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    year = json['year'];
    image = json['image'];
    crew = json['crew'];
    imDbRating = json['imDbRating'];
    imDbRatingCount = json['imDbRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['fullTitle'] = this.fullTitle;
    data['year'] = this.year;
    data['image'] = this.image;
    data['crew'] = this.crew;
    data['imDbRating'] = this.imDbRating;
    data['imDbRatingCount'] = this.imDbRatingCount;
    return data;
  }
}
