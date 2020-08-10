import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 90), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 90, end: 50), weight: 50),
    ]).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutQuint));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) => IconButton(
          onPressed: () {
            if (_colorAnimation.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (_colorAnimation.status == AnimationStatus.dismissed) {
              _animationController.forward();
            } else
              _animationController.forward();
          },
          icon: Icon(Icons.favorite),
          iconSize: _sizeAnimation.value,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: _colorAnimation.value,
        ),
      ),
    );
  }
}
