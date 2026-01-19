import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../providers/global_providers.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_field_item.dart';
import '../widgets/pin_input_row.dart';
import '../widgets/security_question_dropdown.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _associationController = TextEditingController();
  final _mobileController = TextEditingController();
  final _pinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  final _answerController = TextEditingController();
  final viewModel = GlobalProviders.registerViewModel;

  @override
  void initState() {
    super.initState();
    viewModel.loadSecurityQuestions();
    viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    _associationController.dispose();
    _mobileController.dispose();
    _pinController.dispose();
    _confirmPinController.dispose();
    _answerController.dispose();
    viewModel.clearAll();
    super.dispose();
  }

  void _clearAllFields() {
    _associationController.clear();
    _mobileController.clear();
    _pinController.clear();
    _confirmPinController.clear();
    _answerController.clear();
    viewModel.clearAll();
  }

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
              // Association Name
              FormFieldItem(
                label: "Association Name",
                hint: "DSWD-SLP",
                controller: _associationController,
              ),
              const SizedBox(height: 15),

              // Mobile Number
              FormFieldItem(
                label: "Mobile Number",
                hint: "09XXXXXXXXX",
                maxLength: 11,
                keyboardType: TextInputType.number,
                controller: _mobileController,
              ),
              const SizedBox(height: 15),

              // PIN Input
              PinInputRow(
                pinController: _pinController,
                confirmPinController: _confirmPinController,
              ),
              const SizedBox(height: 15),

              // Security Question Dropdown
              SecurityQuestionDropdown(
                label: "Security Question (for PIN reset)",
                questions: viewModel.questions,
                selectedQuestion: viewModel.selectedQuestion,
                onChanged: (q) {
                  if (q != null) viewModel.selectQuestion(q);
                },
              ),
              const SizedBox(height: 15),

              // Security answer
              FormFieldItem(
                label: "Tubag",
                hint: "Isulat ang imong tubag",
                controller: _answerController,
              ),
              const SizedBox(height: 25),

              // Error message
              if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // Create button
              CustomButton(
                text: viewModel.isLoading ? "Creating..." : "Create",
                backgroundColor: AppColors.primary,
                onPressed: viewModel.isLoading
                    ? null
                    : () async {
                        final success = await viewModel.register(
                          associationName: _associationController.text.trim(),
                          mobileNumber: _mobileController.text.trim(),
                          pin: _pinController.text.trim(),
                          confirmPin: _confirmPinController.text.trim(),
                          securityAnswer: _answerController.text.trim(),
                        );

                        if (success && context.mounted) {
                          _clearAllFields();
                          Navigator.pop(context);
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
