import 'package:crispy_starter/models/data_models.dart';
import 'package:crispy_starter/ui/widgets/heart_widget.dart';
import 'package:flutter/material.dart';

class FilmDetailsArguments {
  final Movie movie;
  final String cardTag;

  FilmDetailsArguments(this.movie, {this.cardTag});
}

class FilmDetailsScreen extends StatefulWidget {
  final Movie movie;
  final String cardTag;

  FilmDetailsScreen({this.movie, this.cardTag});

  @override
  _FilmDetailsScreenState createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _opacityPageTitle;
  Animation<double> _opacityMovieTitle;
  Animation<double> _opacityButton;

  Animation<Offset> _slidePageTitle;
  Animation<Offset> _slideMovieTitle;
  Animation<Offset> _slideButton;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _opacityPageTitle = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        curve: Interval(0.01, 0.6, curve: Curves.easeInOut),
        parent: _animationController));
    _opacityMovieTitle = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            curve: Interval(0.01, 0.8, curve: Curves.easeInOut),
            parent: _animationController));
    _opacityButton = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
        parent: _animationController));

    _slidePageTitle = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            curve: Interval(0.1, 0.6, curve: Curves.linearToEaseOut),
            parent: _animationController));
    _slideMovieTitle = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            curve: Interval(0.15, 0.85, curve: Curves.linearToEaseOut),
            parent: _animationController));
    _slideButton = Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(CurvedAnimation(
            curve: Interval(0.75, 1.0, curve: Curves.linearToEaseOut),
            parent: _animationController));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.cardTag,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                  position: _slidePageTitle,
                  child: FadeTransition(
                      opacity: _opacityPageTitle,
                      child: Text("SECONDO SCREEN"))),
              SlideTransition(
                position: _slideMovieTitle,
                child: FadeTransition(
                    opacity: _opacityMovieTitle,
                    child: Text(widget.movie.title)),
              ),
              FadeTransition(opacity: _opacityMovieTitle, child: HeartWidget()),
              SlideTransition(
                position: _slideButton,
                child: FadeTransition(
                  opacity: _opacityButton,
                  child: RaisedButton(
                    onPressed: () {
                      _animationController
                          .reverse()
                          .then((value) => Navigator.pop(context));
                    },
                    child: Text("Back"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
