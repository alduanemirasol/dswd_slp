import 'dart:io';
import 'package:flutter/material.dart';
import '../core/colors.dart';

class ReceiptSection extends StatelessWidget {
  final File? receiptImage;
  final VoidCallback? onPick;
  final VoidCallback? onRemove;

  const ReceiptSection({
    super.key,
    this.receiptImage,
    this.onPick,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Resibo (optional)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onPick,
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: receiptImage != null
                ? Image.file(receiptImage!, fit: BoxFit.cover)
                : const Center(
                    child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                  ),
          ),
        ),
        if (receiptImage != null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onRemove,
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text("Remove", style: TextStyle(color: Colors.red)),
            ),
          ),
      ],
    );
  }
}
