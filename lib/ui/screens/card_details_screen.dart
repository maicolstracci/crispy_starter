import 'package:crispy_starter/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetailsScreen extends StatefulWidget {
  final Gradient gradient;
  final String tag;
  final Color prevColor;

  CardDetailsScreen({this.gradient, this.tag, this.prevColor});

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> sizeAnimation;

  Color _prevColor;

  Tween<double> tweenSize = Tween<double>(begin: 0, end: 480);

  @override
  void initState() {
    _prevColor = widget.prevColor;

    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    sizeAnimation = tweenSize.animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationController.addStatusListener(_onAnimationCompleted);

    super.initState();
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_onAnimationCompleted);
    animationController.dispose();
    super.dispose();
  }

  _onAnimationCompleted(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _prevColor = Theme.of(context).backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(gradient: widget.gradient),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dark Mode!"),
                  SwitchButton(animationController),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 120,
                    width: 200,
                    child: Stack(
                      overflow: Overflow.clip,
                      children: [
                        Container(
                          color: _prevColor,
                        ),
                        AnimatedBuilder(
                          animation: sizeAnimation,
                          builder: (context, child) => Positioned(
                            left: -(sizeAnimation.value / 2),
                            bottom: -(sizeAnimation.value / 2),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: sizeAnimation.value,
                                width: sizeAnimation.value,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).backgroundColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  final AnimationController animationController;

  SwitchButton(this.animationController);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (ctx, themeNotifier, child) => Switch.adaptive(
          value: themeNotifier.isDarkModeEnable,
          onChanged: (value) {
            widget.animationController.reset();
            widget.animationController.forward();
            themeNotifier.setTheme();
          }),
    );
  }
}
