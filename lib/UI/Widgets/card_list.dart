import 'package:crispy_starter/BLoC/Helpers/bloc_base.dart';
import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/Events/swipe_card_event.dart';
import 'package:crispy_starter/UI/Widgets/data_list.dart';
import 'package:crispy_starter/UI/Widgets/persistent_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

import '../../constants.dart';



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

