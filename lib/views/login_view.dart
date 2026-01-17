import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/global_providers.dart';
import '../view_models/login_view_model.dart';
import '../widgets/login_footer.dart';
import '../widgets/mobile_number_display.dart';
import '../widgets/pin_indicator.dart';
import '../widgets/pin_keypad.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: 0), weight: 1),
    ]).animate(_shakeController);
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void triggerShake() {
    _shakeController.forward(from: 0);
  }

  void _onKeyPressed(LoginViewModel viewModel, String key) async {
    viewModel.addDigit(key);

    if (viewModel.pinLength == 4) {
      final success = await viewModel.login("Not set");
      if (!mounted) return;

      if (!success) {
        triggerShake();
      } else {
        GoRouter.of(context).push('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) =>
          LoginViewModel(accountRepository: GlobalProviders.accountRepository),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
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
                  const MobileNumberDisplay(),
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
                  Expanded(
                    child: PinKeypad(
                      onKeyPressed: (key) => _onKeyPressed(viewModel, key),
                    ),
                  ),
                  const LoginFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
