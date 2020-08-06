import 'dart:convert';

import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/Models/data_models.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:crispy_starter/api_keys.dart';
import 'package:dio/dio.dart';

import 'Helpers/bloc_event_state.dart';

class SwipeCardBloc extends BlocEventStateBase<SwipeCardEvent, SwipeCardState> {
  SwipeCardBloc() : super(initialState: SwipeCardState.initialise());

  Future<List<Movie>> requestInfo({String endPoint}) async {

    try {
      Response response = await Dio()
          .get("https://imdb-api.com/en/API/$endPoint/$imbd_api_key");

      MovieData movieData = MovieData.fromJson(response.data);

      return movieData.movies;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Stream<SwipeCardState> eventHandler(
      SwipeCardEvent event, SwipeCardState currentState) async* {
    if (event is SwipeCardEvent) {
      yield SwipeCardState.updateTitle(event.page);
      yield SwipeCardState.loadingInfo();
      var movieList = await requestInfo(
          endPoint: imdbEndpoint[event.page]);

      yield SwipeCardState.finishedLoading(data: movieList);
    }
  }
}

List<String > imdbEndpoint = [
  "Top250Movies",
  "Top250TVs",
  "MostPopularMovies",
  "MostPopularTVs"
];
