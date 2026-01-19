import 'package:flutter/animation.dart';

class AnimationHelper {
  static double shakeDistance = 10; // Increase shake distance
  static double shakeWeight = 2; // Make each shake last longer

  static Animation<double> shakeAnimation(AnimationController controller) {
    return TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -shakeDistance), weight: 1),
      TweenSequenceItem(
        tween: Tween(begin: -shakeDistance, end: shakeDistance),
        weight: shakeWeight,
      ),
      TweenSequenceItem(
        tween: Tween(begin: shakeDistance, end: -shakeDistance),
        weight: shakeWeight,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -shakeDistance, end: shakeDistance),
        weight: shakeWeight,
      ),
      TweenSequenceItem(tween: Tween(begin: shakeDistance, end: 0), weight: 1),
    ]).animate(controller);
  }
}
