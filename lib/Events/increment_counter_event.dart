

import 'file:///C:/Users/Maicol/AndroidStudioProjects/crispy_starter/lib/BLoC/Helpers/bloc_event_state.dart';

class IncrementCounterEvent extends BlocEvent {

  final String counter;

  IncrementCounterEvent({
    this.counter: "count",
  }) : assert(counter != null);
}

