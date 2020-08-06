import 'package:crispy_starter/BLoC/Helpers/bloc_event_state.dart';

class SwipeCardState extends BlocState {
  SwipeCardState({
    this.currentCardTitle,
    this.currentPage,
    this.isLoading = false,
    this.data
  });

  String currentCardTitle;
  int currentPage;
  bool isLoading;
  List<String> data;

  factory SwipeCardState.initialise() {
    return SwipeCardState(
      currentCardTitle: cardTitles[0],
      currentPage:0,
      isLoading: false
    );
  }

  factory SwipeCardState.updateTitle(currentPage) {
    return SwipeCardState(
      currentCardTitle: cardTitles[currentPage],
      currentPage: currentPage,
    );
  }

  factory SwipeCardState.loadingInfo() {
    return SwipeCardState(
      isLoading: true
    );
  }

  factory SwipeCardState.finishedLoading({List<String> data}) {
    return SwipeCardState(
        isLoading: false,
      data:data
    );
  }

}

List<String> cardTitles = [
  "Top 25 movies",
  "Top 20 movies",
  "Top 12 movies",
  "Top 5 movies",
];
