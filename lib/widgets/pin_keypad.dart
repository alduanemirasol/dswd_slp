import 'package:flutter/material.dart';
import 'keypad_button.dart';

class PinKeypad extends StatelessWidget {
  final void Function(String) onKeyPressed;

  const PinKeypad({required this.onKeyPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final label = "${index + 1}";
              return KeypadButton(
                label: label,
                onTap: () => onKeyPressed(label),
              );
            },
          ),
          const SizedBox(height: 12),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
            children: [
              Container(),
              KeypadButton(label: "0", onTap: () => onKeyPressed("0")),
            ],
          ),
        ],
      ),
    );
  }
}
