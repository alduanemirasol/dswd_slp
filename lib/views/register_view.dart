import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/header.dart';
import '../core/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: const Header(title: "Bag-ong Account", showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Association Name
            buildLabel("Association Name"),
            buildTextField(hint: "DSWD-SLP"),
            const SizedBox(height: 15),

            // Mobile Number
            buildLabel("Mobile Number"),
            buildTextField(
              hint: "09XXXXXXXXX",
              keyboardType: TextInputType.number,
              maxLength: 11,
            ),
            const SizedBox(height: 15),

            // PIN and Confirm PIN
            buildLabel("PIN"),
            Row(
              children: [
                Expanded(
                  child: buildTextField(
                    hint: "Enter 4-digit PIN",
                    obscureText: true,
                    maxLength: 4,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildTextField(
                    hint: "Re-enter PIN",
                    obscureText: true,
                    maxLength: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Security Question
            buildLabel("Security Question (for PIN reset)"),
            DropdownButtonFormField<String>(
              hint: const Text("Pili ug pangutana"),
              items: const [
                DropdownMenuItem(value: "q1", child: Text("Question 1")),
                DropdownMenuItem(value: "q2", child: Text("Question 2")),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 15),

            // Answer
            buildLabel("Tubag (Answer)"),
            buildTextField(hint: "Isulat ang imong tubag"),
            const SizedBox(height: 25),

            // Register Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget buildTextField({
    required TextEditingController controller,
    String? hint,
    bool obscureText = false,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    String? errorText,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14),
        errorText: errorText,
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
      ),
    );
  }
}
