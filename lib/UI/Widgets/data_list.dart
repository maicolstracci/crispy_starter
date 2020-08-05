import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/Helpers/bloc_event_state_builder.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:crispy_starter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  final PageController pageController = PageController();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

class DataList extends StatelessWidget {
  final PageController pageController = Singleton().pageController;
  bool reversed = false;

  @override
  Widget build(BuildContext context) {
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);

    return BlocEventStateBuilder<SwipeCardEvent, SwipeCardState>(
      bloc: swipeCardBloc,
      builder: (BuildContext context, SwipeCardState state) => SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>

                //TODO: Use the offset of page controller to drive the out animation...

                AnimatedBuilder(
                  animation: pageController,
                  builder: (cxt, child) {

                    return Opacity(
//                      opacity: 1,
                      opacity: 1-(pageController.page%1),
                      child: Transform.translate(
                        child: child,
                        offset: Offset(
//: 360-(pageController.offset % 360)
                            -(pageController.offset % 360),
                            0),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: gradients[state.currentPage]
                    ),
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      state.currentPage.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
