import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/Helpers/bloc_event_state_builder.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);

    return BlocEventStateBuilder<SwipeCardEvent, SwipeCardState>(
      bloc: swipeCardBloc,
      builder: (BuildContext context, SwipeCardState state) => SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                Container(
                  color: index %2 == 0 ? Colors.redAccent[100] : Colors.redAccent[200],
                  padding: const EdgeInsets.all(25.0),
                  child: Text(state.currentPage.toString(),textAlign: TextAlign.center,),
                ),
            childCount: 10),
      ),
    );

//    return BlocEventStateBuilder<SwipeCardEvent, SwipeCardState>(
//      bloc: swipeCardBloc,
//      builder: (BuildContext context, SwipeCardState state) =>
//          ListView.separated(
//              scrollDirection: Axis.vertical,
//              itemBuilder: (context, index) =>
//                  Text(
//                    state.currentPage.toString(),
//                    textAlign: TextAlign.center,
//                  ),
//              separatorBuilder: (context, index) =>
//                  SizedBox(
//                    height: 80,
//                  ),
//              itemCount: 5),
//    );
  }
}