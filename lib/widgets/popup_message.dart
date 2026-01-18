import 'package:flutter/material.dart';

class PopupMessage {
  static void show(
    BuildContext context, {
    required String message,
    Color color = Colors.blue,
    IconData icon = Icons.info,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Usage example:

ElevatedButton(
  onPressed: () {
    PopupMessage.show(
      context,
      message: "Capital added successfully!",
      color: Colors.green,
      icon: Icons.check_circle,
    );
  },
  child: const Text("Show Message"),
);

*/
