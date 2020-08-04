import 'package:crispy_starter/Events/increment_counter_event.dart';
import 'package:crispy_starter/States/increment_counter_state.dart';
import 'Helpers/bloc_event_state.dart';

class IncrementCounterBloc
    extends BlocEventStateBase<IncrementCounterEvent, IncrementCounterState> {
  IncrementCounterBloc()
      : super(initialState: IncrementCounterState.initialise(0));

  @override
  Stream<IncrementCounterState> eventHandler(
      IncrementCounterEvent event, IncrementCounterState currentState) async* {

    if (event is IncrementCounterEvent) {

      yield IncrementCounterState.increment(currentState.counter);
    }
  }
}