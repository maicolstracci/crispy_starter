import 'dart:ui';
import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/States/swipe_card_state.dart';
import 'package:crispy_starter/constants.dart';
import 'package:flutter/material.dart';

class CardListHeader extends StatefulWidget {
  final ValueNotifier<double> notifier;
  double shrinkOffset = 0;

  CardListHeader({this.notifier, this.shrinkOffset});

  @override
  _CardListHeaderState createState() => _CardListHeaderState();
}

class _CardListHeaderState extends State<CardListHeader> {
  int _previousPage;
  PageController _pageController;

  void _onScroll() {
    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();
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
    SwipeCardBloc swipeCardBloc = BlocProvider.of<SwipeCardBloc>(context);

    return SizedBox.expand(
        child: AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        final color =
            _pageController.hasClients ? _pageController.page / 3 : .0;

        return DecoratedBox(
            decoration: background.evaluate(AlwaysStoppedAnimation(color)),
            child: child);
      },
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (page) =>
              swipeCardBloc.emitEvent(SwipeCardEvent(page: page)),
          itemBuilder: (cxt, index) => ContainerCard(
                index: index,
                shrinkOffset: widget.shrinkOffset,
              ),
          itemCount: 4),
    ));
  }
}

class ContainerCard extends StatelessWidget {
  final int index;
  final double shrinkOffset;

  const ContainerCard({Key key, this.index, this.shrinkOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: Container(
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
        child: Center(
          child: Text(cardTitles[index], textAlign: TextAlign.center,),
        )
      ),
    );
  }
}
