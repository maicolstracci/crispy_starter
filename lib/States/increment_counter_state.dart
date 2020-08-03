import 'package:crispy_starter/BLoC/bloc_event_state.dart';

class IncrementCounterState extends BlocState{


  IncrementCounterState({
    this.counter,
});

  int counter;

  factory IncrementCounterState.initialise(counter) {
    return IncrementCounterState(
      counter: counter,
    );
  }

  factory IncrementCounterState.increment(counter) {

    return IncrementCounterState(
      counter: counter+1,
    );
  }

}