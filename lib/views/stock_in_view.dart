import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/image_upload_field.dart';
import '../widgets/message_banner.dart';
import '../widgets/read_only_input_row.dart';

class StockInView extends StatelessWidget {
  const StockInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(title: 'Stock In', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const MessageBanner(
              message: 'Success message',
              color: Colors.green,
              icon: Icons.check_circle,
            ),
            const MessageBanner(
              message: 'Error message',
              color: Colors.red,
              icon: Icons.error,
            ),
            const SizedBox(height: 15),
            const ReadOnlyInputRow(
              icon: Icons.calendar_today,
              label: 'Date',
              value: 'Select Date',
            ),
            const SizedBox(height: 15),
            const CustomDropdownField(
              icon: Icons.category,
              label: 'Kategorya',
              value: null,
              items: ['Item 1', 'Item 2'],
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              label: 'Pangalan sa produkto',
              prefixIcon: Icon(Icons.edit, color: AppColors.primary),
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              label: 'Presyo sa pagpalit',
              prefixText: '₱',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              label: 'Presyo sa pagbaligya',
              prefixIcon: Icon(Icons.calculate, color: AppColors.primary),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              label: 'Gidaghanon',
              prefixIcon: Icon(Icons.shopping_cart, color: AppColors.primary),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            const ImageUploadField(image: null),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          text: 'Save',
          backgroundColor: AppColors.primary,
          onPressed: null,
        ),
      ),
    );
  }
}
