import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../helpers/box_shadows_helper.dart';

class CashOnHandCard extends StatefulWidget {
  final String cash;
  final String mobileNumber;

  const CashOnHandCard({
    super.key,
    required this.cash,
    required this.mobileNumber,
  });

  @override
  State<CashOnHandCard> createState() => _CashOnHandCardState();
}

class _CashOnHandCardState extends State<CashOnHandCard> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.defaultShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cash on Hand',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 219, 219, 219),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),

          // Cash amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  _isHidden ? '****' : widget.cash,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
                // Eye icon
                child: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Mobile number
          Text(
            'Mobile Number: ${widget.mobileNumber}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 219, 219, 219),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
