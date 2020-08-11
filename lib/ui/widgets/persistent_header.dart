import 'dart:ui';

import 'package:crispy_starter/bloc/helpers/bloc_base.dart';
import 'package:crispy_starter/bloc/swipe_card_bloc.dart';
import 'package:crispy_starter/constants.dart';
import 'package:crispy_starter/events/swipe_card_event.dart';
import 'package:crispy_starter/states/swipe_card_state.dart';
import 'package:flutter/material.dart';

class CardListHeader extends StatefulWidget {
  final ValueNotifier<double> notifier;
  final double shrinkOffset;

  CardListHeader({this.notifier, this.shrinkOffset});

  @override
  _CardListHeaderState createState() => _CardListHeaderState();
}

class _CardListHeaderState extends State<CardListHeader> {
  int _previousPage;
  PageController _pageController;

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();

      SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);
      swipeCardBloc.emitEvent(SwipeCardEvent(page: _previousPage));
    }

    widget.notifier?.value = _pageController.page - _previousPage;
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    )..addListener(_onScroll);

    _previousPage = _pageController.initialPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              final color =
                  _pageController.hasClients ? _pageController.page / 3 : .0;
              return DecoratedBox(
                  decoration:
                      background.evaluate(AlwaysStoppedAnimation(color)),
                  child: child);
            },
            child: PageView.builder(
                controller: _pageController,
                itemBuilder: (cxt, index) => ContainerCard(
                      index: index,
                      shrinkOffset: widget.shrinkOffset,
                    ),
                itemCount: 4)));
  }
}

class ContainerCard extends StatelessWidget {
  final int index;
  final double shrinkOffset;

  const ContainerCard({Key key, this.index, this.shrinkOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: gradients[index],
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 15,
              )
            ],
            borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Opacity(
                opacity: (1 - (shrinkOffset / 70)).clamp(0.0, 1.0),
                child: Text(
                  "Testo che scompare",
                  textAlign: TextAlign.start,
                )),
            Text(
              cardTitles[index],
              textAlign: TextAlign.center,
            ),
            Opacity(
                opacity: (1 - (shrinkOffset / 70)).clamp(0.0, 1.0),
                child: Text(
                  "Testo che scompare",
                  textAlign: TextAlign.end,
                ))
          ],
        ));
  }
}
