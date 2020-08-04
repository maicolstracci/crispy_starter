
import 'package:crispy_starter/BLoC/Helpers/bloc_event_state.dart';

class SwipeCardState extends BlocState{

  SwipeCardState({
    this.currentPage,
  });

  int currentPage;

  factory SwipeCardState.initialise(page) {
    return SwipeCardState(
      currentPage: page,
    );
  }

  factory SwipeCardState.updatePage(page) {

    return SwipeCardState(
      currentPage: page,
    );
  }

}