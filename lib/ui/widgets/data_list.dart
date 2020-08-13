import 'package:crispy_starter/bloc/helpers/bloc_base.dart';
import 'package:crispy_starter/bloc/helpers/bloc_event_state_builder.dart';
import 'package:crispy_starter/bloc/swipe_card_bloc.dart';
import 'package:crispy_starter/events/swipe_card_event.dart';
import 'package:crispy_starter/router.dart';
import 'package:crispy_starter/states/swipe_card_state.dart';
import 'package:flutter/material.dart';

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
        offset: Offset(
            -widget.notifier.value * MediaQuery.of(context).size.width, 0),
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
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Hero(
                          tag: "Card$index",
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Router.filmDetailsRoute,
                                  arguments: FilmDetailsArguments(
                                      state.data[index],
                                      cardTag: "Card$index"));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: Colors.blue,
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
