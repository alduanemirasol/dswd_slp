import 'package:flutter/material.dart';
import '../widgets/filter_button.dart';
import '../widgets/small_card.dart';

class OwnerView extends StatelessWidget {
  const OwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SmallCard(
                        title: "Overdue",
                        value: "₱0.00 (0)",
                        red: true,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: SmallCard(
                        title: "Due this Week",
                        value: "₱0.00 (0)",
                        red: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FilterButton(text: "Tanan", active: true),
                    SizedBox(width: 12),
                    FilterButton(text: "Overdue", active: false),
                    SizedBox(width: 12),
                    FilterButton(text: "Nabayran", active: false),
                  ],
                ),
                const SizedBox(height: 80),
                const Text(
                  "Walay bayranan",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFF0C4B3E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              "Pagdugang og Bayronon",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
