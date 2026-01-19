import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../helpers/box_shadows_helper.dart';

class MobileNumberDisplay extends StatelessWidget {
  final String? mobileNumber;

  const MobileNumberDisplay({super.key, this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    final displayNumber = mobileNumber ?? "Not set";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: AppShadows.defaultShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Mobile Number: ",
            style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
          ),
          Flexible(
            child: Text(
              displayNumber,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.swap_horiz, color: AppColors.textPrimary, size: 22),
        ],
      ),
    );
  }
}
