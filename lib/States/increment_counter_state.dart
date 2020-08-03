import 'file:///C:/Users/Maicol/AndroidStudioProjects/crispy_starter/lib/BLoC/Helpers/bloc_event_state.dart';

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