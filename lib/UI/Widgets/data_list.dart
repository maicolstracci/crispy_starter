import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/Helpers/bloc_event_state_builder.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DataList extends StatefulWidget {
  final ValueNotifier<double> notifier;

  DataList({this.notifier});

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);
      swipeCardBloc.emitEvent(SwipeCardEvent(page: 0));

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);
    return AnimatedBuilder(
      animation: widget.notifier,
      builder: (context, child) => Transform.translate(
        offset: Offset(-widget.notifier.value * MediaQuery.of(context).size.width, 0),
        child: child,
      ),
      child: BlocEventStateBuilder<SwipeCardEvent, SwipeCardState>(
          bloc: swipeCardBloc,
          builder: (BuildContext context, SwipeCardState state) {
            if (state.isLoading) {
              return Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator()),
              );
            } else if (state.data.length == 0) {
              return Center(
                child: Text("Finite le free api calls :'("),
              );
            } else {
              return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                        height: 50,
                        color: Colors.blue[100],
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              state.data[index].title,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              state.data[index].imDbRating,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              state.data[index].year,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 30,
                      ),
                  itemCount: state.data.length);
            }
          }),
    );
  }
}
