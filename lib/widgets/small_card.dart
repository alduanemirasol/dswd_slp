import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String title;
  final String value;
  final bool red;

  const SmallCard({
    super.key,
    required this.title,
    required this.value,
    required this.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Color(0xff444444)),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: red ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
