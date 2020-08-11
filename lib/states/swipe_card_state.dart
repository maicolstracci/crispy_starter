import 'package:crispy_starter/bloc/Helpers/bloc_event_state.dart';
import 'package:crispy_starter/models/data_models.dart';

class SwipeCardState extends BlocState {
  SwipeCardState({this.currentPage, this.isLoading, this.data});

  int currentPage;
  bool isLoading;
  List<Movie> data;

  factory SwipeCardState.initialise() {
    return SwipeCardState(currentPage: 0, isLoading: true);
  }

  factory SwipeCardState.updateTitle(currentPage) {
    return SwipeCardState(
      currentPage: currentPage,
    );
  }

  factory SwipeCardState.loadingInfo() {
    return SwipeCardState(isLoading: true);
  }

  factory SwipeCardState.finishedLoading({List<Movie> data}) {
    return SwipeCardState(isLoading: false, data: data);
  }
}

List<String> cardTitles = [
  "Top 250 movies",
  "Top 250 series",
  "Most popular movies",
  "Most popular series",
];
