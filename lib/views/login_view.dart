import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/colors.dart';
import '../providers/global_providers.dart';
import '../widgets/login_footer.dart';
import '../widgets/mobile_number_display.dart';
import '../widgets/pin_indicator.dart';
import '../widgets/pin_keypad.dart';
import '../widgets/mobile_number_input_dialog.dart';
import '../helpers/animation_helper.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;
  final viewModel = GlobalProviders.loginViewModel;

  @override
  void initState() {
    super.initState();

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _shakeAnimation = AnimationHelper.shakeAnimation(_shakeController);

    viewModel.addListener(_onViewModelChanged);
    viewModel.loadSavedAccount();
  }

  void _onViewModelChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _shakeController.dispose();
    viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void triggerShake() {
    _shakeController.forward(from: 0);
  }

  Future<void> _onKeyPressed(String key) async {
    viewModel.addDigit(key);

    if (viewModel.pinLength == 4) {
      final mobileNumber = viewModel.savedMobileNumber ?? "Not set";
      final success = await viewModel.login(mobileNumber);

      if (!mounted) return;

      if (!success) {
        triggerShake();
      } else {
        GoRouter.of(context).go('/home');
      }
    }
  }

  void _showChangeMobileDialog() {
    showDialog(
      context: context,
      builder: (_) => MobileNumberInputDialog(
        initialNumber: viewModel.savedMobileNumber,
        onSubmitted: (newNumber) async {
          await viewModel.updateMobileNumber(newNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Image.asset('lib/assets/app_logo.png', height: 80),
                const SizedBox(height: 10),
                const Text(
                  "E.M.P.O.W.E.R",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: _showChangeMobileDialog,
              child: MobileNumberDisplay(
                mobileNumber: viewModel.savedMobileNumber,
              ),
            ),
            const SizedBox(height: 25),

            const Text(
              "PIN",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),

            PinIndicator(
              pinLength: viewModel.pinLength,
              shakeAnimation: _shakeAnimation,
            ),
            const SizedBox(height: 25),

            Expanded(child: PinKeypad(onKeyPressed: _onKeyPressed)),

            const LoginFooter(),
          ],
        ),
      ),
    );
  }
}
