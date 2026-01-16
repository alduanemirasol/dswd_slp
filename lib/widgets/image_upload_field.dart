import 'dart:io';
import 'package:flutter/material.dart';
import '../core/colors.dart';

class ImageUploadField extends StatelessWidget {
  final File? image;

  const ImageUploadField({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Upload Image',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: image != null
              ? Image.file(image!, fit: BoxFit.cover)
              : const Center(
                  child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                ),
        ),
      ],
    );
  }
}
