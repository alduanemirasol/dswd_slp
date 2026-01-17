import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_field_item.dart';
import '../widgets/pin_input_row.dart';
import '../widgets/security_question_dropdown.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Bag-ong Account",
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormFieldItem(label: "Association Name", hint: "DSWD-SLP"),
              const SizedBox(height: 15),
              FormFieldItem(
                label: "Mobile Number",
                hint: "09XXXXXXXXX",
                maxLength: 11,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              PinInputRow(),
              const SizedBox(height: 15),
              SecurityQuestionDropdown(
                label: "Security Question (for PIN reset)",
                items: const [
                  DropdownMenuItem(value: "q1", child: Text("Question 1")),
                  DropdownMenuItem(value: "q2", child: Text("Question 2")),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              FormFieldItem(label: "Tubag", hint: "Isulat ang imong tubag"),
              const SizedBox(height: 25),
              CustomButton(
                text: "Create",
                backgroundColor: AppColors.primary,
                onPressed: () {
                  // Your register action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
