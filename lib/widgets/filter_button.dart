import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool active;

  const FilterButton({super.key, required this.text, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF0C4B3E) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
