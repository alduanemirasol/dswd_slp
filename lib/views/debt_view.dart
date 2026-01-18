import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/toggle_buttons.dart';
import 'customer_view.dart';
import 'owner_view.dart';

class DebtView extends StatelessWidget {
  const DebtView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Utang', showBackButton: true),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ToggleButtonsWidget(),
          const SizedBox(height: 15),
          const Expanded(
            child: IndexedStack(
              index: 0,
              children: [CustomerView(), OwnerView()],
            ),
          ),
        ],
      ),
    );
  }
}
