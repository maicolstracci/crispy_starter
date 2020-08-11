import 'package:crispy_starter/main.dart';
import 'package:crispy_starter/ui/screens/film_details_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static const homeRoute = '/';

  static const filmDetailsRoute = '/filmDetailsScreen';

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
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
