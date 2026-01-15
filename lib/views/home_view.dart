import 'package:dswd_slp_new/widgets/cash_on_hand_card.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/menu_card.dart';
import '../widgets/menu_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(title: 'Home'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Cash summary card
          const CashOnHandCard(cash: 'PHP ****', mobileNumber: 'Not set'),
          const SizedBox(height: 16),

          // Transactions grid
          MenuGrid(
            title: 'Transactions',
            items: const [
              MenuCard(title: 'Halin', iconPath: 'lib/assets/record_icon.png'),
              MenuCard(title: 'Utang', iconPath: 'lib/assets/utang_icon.png'),
              MenuCard(title: 'Gasto', iconPath: 'lib/assets/gasto_icon.png'),
              MenuCard(
                title: 'Stock In',
                iconPath: 'lib/assets/stock_in_icon.png',
              ),
              MenuCard(
                title: 'Capital\nManagement',
                iconPath: 'lib/assets/capital_management_icon.png',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Reports grid
          MenuGrid(
            title: 'Reports',
            items: const [
              MenuCard(
                title: 'Balance\nSheet',
                iconPath: 'lib/assets/balance_sheet_icon.png',
              ),
              MenuCard(
                title: 'Income\nStatement',
                iconPath: 'lib/assets/income_statement_icon.png',
              ),
              MenuCard(
                title: 'Cash\nFlow',
                iconPath: 'lib/assets/cashflow_icon.png',
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
