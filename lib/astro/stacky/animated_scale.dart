import 'package:flutter/material.dart';

class AnimatedScale extends ImplicitlyAnimatedWidget {
  final Widget child;
  final double scale;

  const AnimatedScale({
    Key? key,
    required this.child,
    required this.scale,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(key: key, curve: curve, duration: duration);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedScaleState();
}

class _AnimatedScaleState extends AnimatedWidgetBaseState<AnimatedScale> {
  Tween<double>? _scale;
  late Animation<double> _scaleAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scale = visitor(
      _scale,
      widget.scale,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _scaleAnimation = animation.drive(_scale!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: widget.child,
    );
  }
}
