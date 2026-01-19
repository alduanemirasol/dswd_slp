import 'package:flutter/material.dart';
import 'form_field_item.dart';

class PinInputRow extends StatelessWidget {
  final TextEditingController? pinController;
  final TextEditingController? confirmPinController;

  const PinInputRow({super.key, this.pinController, this.confirmPinController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormFieldItem(
            label: "PIN",
            hint: "Enter 4-digit PIN",
            obscureText: true,
            maxLength: 4,
            controller: pinController,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FormFieldItem(
            label: "Confirm PIN",
            hint: "Re-enter PIN",
            obscureText: true,
            maxLength: 4,
            controller: confirmPinController,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
