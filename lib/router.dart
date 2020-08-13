import 'package:crispy_starter/main.dart';
import 'package:crispy_starter/models/data_models.dart';
import 'package:crispy_starter/ui/screens/card_details_screen.dart';
import 'package:crispy_starter/ui/screens/film_details_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static const homeRoute = '/';

  static const filmDetailsRoute = '/filmDetailsScreen';
  static const cardDetailsRoute = '/cardDetailsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => CrispyStarter());
      case filmDetailsRoute:
        final FilmDetailsArguments args = settings.arguments;

        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              FilmDetailsScreen(
            movie: args.movie,
            cardTag: args.cardTag,
          ),
        );

      case cardDetailsRoute:
        final CardDetailsArguments args = settings.arguments;

        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              CardDetailsScreen(
            gradient: args.gradient,
            tag: args.tag,
            prevColor: args.prevColor,
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

class FilmDetailsArguments {
  final Movie movie;
  final String cardTag;

  FilmDetailsArguments(this.movie, {this.cardTag});
}

class CardDetailsArguments {
  final Gradient gradient;
  final String tag;
  final Color prevColor;

  CardDetailsArguments({this.gradient, this.tag, this.prevColor});
}
