import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CardList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SwipeCardBloc swipeCardBloc =
    BlocProvider.of<SwipeCardBloc>(context);

    return PageView.builder(
      onPageChanged: (index)=> swipeCardBloc.emitEvent(SwipeCardEvent(page: index)),
      physics: PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
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
    return Container(height: 200,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(16),
    child: Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(16)
      ),
      
    ),);
  }
}
