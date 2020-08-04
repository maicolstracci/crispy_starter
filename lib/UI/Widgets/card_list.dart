import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CardList extends StatelessWidget {

  PageController controller;

  CardList({this.controller});

  @override
  Widget build(BuildContext context) {

    SwipeCardBloc swipeCardBloc =
    BlocProvider.of<SwipeCardBloc>(context);

    return PageView.builder(
      controller: this.controller,
      onPageChanged: (index)=> swipeCardBloc.emitEvent(SwipeCardEvent(page: index)),
      physics: PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
//        itemBuilder: (context, index) => Center(child: Text(index.toString())),
        itemBuilder: (context, index) => ContainerCard(index: index),
//        separatorBuilder: (context, index) => SizedBox(
//              width: 8,
//            ),
        itemCount: 3);
  }
}

class ContainerCard extends StatelessWidget {
  final int index;

  const ContainerCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xff74ebd5),
              Color(0xffACB6E5),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.3, 1],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: 80, left: 40, right: 40, bottom: 50),
        child: SizedBox(
            height: 100,
            width: 200,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff74ebd5),
                          Color(0xffACB6E5),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.3, 1],
                        tileMode: TileMode.clamp),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 5,
                          blurRadius: 30)
                    ]),
                child: Center(child: Text("$index $index $index")))),
      ),
    );
  }
}
