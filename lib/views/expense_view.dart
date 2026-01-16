import 'package:dswd_slp_new/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/custom_date_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/message_banner.dart';
import '../widgets/receipt_section.dart';

class ExpenseView extends StatelessWidget {
  const ExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Gasto', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Banners
            const MessageBanner(
              message: "Success message",
              color: AppColors.success,
              icon: Icons.check_circle,
            ),
            const MessageBanner(
              message: "Error message",
              color: AppColors.error,
              icon: Icons.error,
            ),

            const SizedBox(height: 15),

            // Date Picker
            const CustomDatePicker(label: 'Petsa', value: 'January 16, 2026'),
            const SizedBox(height: 15),

            // Category Dropdown
            const CustomDropdownField(
              icon: Icons.category,
              label: 'Kategorya',
              value: null,
              items: ['Category 1', 'Category 2'],
            ),
            const SizedBox(height: 15),

            // Amount
            const CustomTextField(
              label: 'Presyo',
              prefixText: '₱',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            // Description
            const CustomTextField(
              label: 'Deskripsyon',
              prefixIcon: Icon(Icons.description, color: AppColors.primary),
            ),
            const SizedBox(height: 25),

            // Receipt Section
            const ReceiptSection(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          text: 'Rekord',
          backgroundColor: AppColors.primary,
          onPressed: () {},
        ),
      ),
    );
  }
}
