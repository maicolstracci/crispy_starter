import 'package:crispy_starter/ui/widgets/persistent_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardList implements SliverPersistentHeaderDelegate {
  ValueNotifier<double> notifier;

  CardList({this.notifier});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CardListHeader(notifier: notifier, shrinkOffset: shrinkOffset);
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
