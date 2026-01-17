import 'package:flutter/material.dart';
import '../constants/colors.dart';

class PinIndicator extends StatelessWidget {
  final int pinLength;
  final Animation<double> shakeAnimation;

  const PinIndicator({
    required this.pinLength,
    required this.shakeAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(shakeAnimation.value, 0),
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index < pinLength
                  ? AppColors.primaryLight
                  : Colors.transparent,
              border: Border.all(color: Colors.black54, width: 2),
            ),
          );
        }),
      ),
    );
  }
}
