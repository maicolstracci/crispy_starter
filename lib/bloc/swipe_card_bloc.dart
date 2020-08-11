import 'package:crispy_starter/bloc/helpers/bloc_event_state.dart';
import 'package:crispy_starter/events/swipe_card_event.dart';
import 'package:crispy_starter/services/networking.dart';
import 'package:crispy_starter/states/swipe_card_state.dart';

class SwipeCardBloc extends BlocEventStateBase<SwipeCardEvent, SwipeCardState> {
  SwipeCardBloc() : super(initialState: SwipeCardState.initialise());

  NetworkingService networkingService = NetworkingService();

  @override
  Stream<SwipeCardState> eventHandler(
      SwipeCardEvent event, SwipeCardState currentState) async* {
    if (event is SwipeCardEvent) {
      yield SwipeCardState.updateTitle(event.page);
      yield SwipeCardState.loadingInfo();

      var movieList = await networkingService.getInfo(
          endPoint: networkingService.imdbEndPoint[event.page]);

      yield SwipeCardState.finishedLoading(data: movieList);
    }
  }
}
