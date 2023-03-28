import 'package:flutter/material.dart';

///
///Classe custom di circular progress indicator
///da utilizzare in BLOC
///
///
///
class TinderAnimation extends StatefulWidget {
  final double size;
  final Duration duration;

  const TinderAnimation({
    Key? key,
    this.size = 80.0,
    this.duration = const Duration(milliseconds: 1500),
  }) : super(key: key);

  @override
  _TinderAnimationState createState() => _TinderAnimationState();
}

class _TinderAnimationState extends State<TinderAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14,
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
