import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

import '../../constants.dart';

class CardList implements SliverPersistentHeaderDelegate {
  PageController pageController;
  Animatable<Decoration> background;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);

    background = TweenSequence<Decoration>([
      TweenSequenceItem(
        weight: 1.0,
        tween: DecorationTween(
          begin: BoxDecoration(
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
          end: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.red[800],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.3, 1],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: DecorationTween(
          begin: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.red[800],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.3, 1],
                tileMode: TileMode.clamp),
          ),
          end: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.green[900],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.3, 1],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: DecorationTween(
          begin: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.green[900],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.3, 1],
                tileMode: TileMode.clamp),
          ),
          end: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.blue[900],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.3, 1],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
    ]);
    pageController = PageController();

    return SizedBox.expand(
        child: AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        final color = pageController.hasClients ? pageController.page / 3 : .0;

        return DecoratedBox(
            decoration: background.evaluate(AlwaysStoppedAnimation(color)),
            child: child);
      },
      child: PageView.builder(
          controller: pageController,
          onPageChanged: (page) =>
              swipeCardBloc.emitEvent(SwipeCardEvent(page: page)),
          itemBuilder: (cxt, index) => ContainerCard(index: index),
          itemCount: 4),
    ));
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 180;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class ContainerCard extends StatelessWidget {
  final int index;

  const ContainerCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(gradient: gradients[index],
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 15,
          )
        ],
        borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(child: Text("Index: $index")),
      ),
    );
  }
}
