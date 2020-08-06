import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/Helpers/bloc_event_state_builder.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DataList extends StatelessWidget {
  final ValueNotifier<double> notifier;

  DataList({this.notifier});

  @override
  Widget build(BuildContext context) {
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);

    return AnimatedBuilder(
      animation: notifier,
      builder: (context, child) => Transform.translate(
        offset: Offset(-notifier.value * MediaQuery.of(context).size.width, 0),
        child: child,
      ),
      child: BlocEventStateBuilder<SwipeCardEvent, SwipeCardState>(
        bloc: swipeCardBloc,
        builder: (BuildContext context, SwipeCardState state) => state.isLoading
            ? Center(
              child: SizedBox(
                  height: 100, width: 100, child: CircularProgressIndicator()),
            )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                      height: 50,
                      color: Colors.blue[100],
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          state.data[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 30,
                    ),
                itemCount: state.data.length),
      ),
    );
  }
}
