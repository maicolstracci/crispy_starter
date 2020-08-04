

import 'package:crispy_starter/BLoC/Helpers/bloc_event_state.dart';

class IncrementCounterEvent extends BlocEvent {

  final String counter;

  IncrementCounterEvent({
    this.counter: "count",
  }) : assert(counter != null);
}

