import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';

import 'Helpers/bloc_event_state.dart';

class SwipeCardBloc
    extends BlocEventStateBase<SwipeCardEvent, SwipeCardState> {
  SwipeCardBloc()
      : super(initialState: SwipeCardState.initialise(0));

  @override
  Stream<SwipeCardState> eventHandler(
      SwipeCardEvent event, SwipeCardState currentState) async* {

    if (event is SwipeCardEvent) {

      yield SwipeCardState.updatePage(event.page);
    }
  }
}