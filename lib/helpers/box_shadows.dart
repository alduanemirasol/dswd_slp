import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Colors.grey.withAlpha(51),
      blurRadius: 2,
      offset: const Offset(0, 2),
    ),
  ];
}
