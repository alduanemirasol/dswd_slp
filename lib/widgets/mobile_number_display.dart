import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../helpers/box_shadows_helper.dart';

class MobileNumberDisplay extends StatelessWidget {
  const MobileNumberDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: AppShadows.defaultShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Mobile Number: ",
            style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
          ),
          Flexible(
            child: Text(
              "Not set",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.swap_horiz, color: AppColors.textPrimary, size: 22),
        ],
      ),
    );
  }
}
