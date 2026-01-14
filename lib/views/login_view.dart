import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/colors.dart';
import '../providers/global_providers.dart';
import '../view_models/login_view_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) =>
          LoginViewModel(accountRepository: GlobalProviders.accountRepository),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: AppColors.surface,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Image.asset('lib/assets/logo.png', height: 80),
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
                  _buildMobileNumberDisplay(),
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
                  _buildPinIndicator(viewModel),
                  const SizedBox(height: 25),
                  Expanded(child: _buildKeypad(viewModel)),
                  _buildFooter(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileNumberDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 51),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Mobile Number: ",
            style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
          ),
          Flexible(
            child: Text(
              "Not set",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.swap_horiz, color: AppColors.textPrimary, size: 22),
        ],
      ),
    );
  }

  Widget _buildPinIndicator(LoginViewModel viewModel) {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value, 0),
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index < viewModel.pinLength
                  ? AppColors.primaryLight
                  : Colors.transparent,
              border: Border.all(color: Colors.black54, width: 2),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeypad(LoginViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final label = "${index + 1}";
              return _KeypadButton(
                label: label,
                onTap: () => _onKeyPressed(viewModel, label),
              );
            },
          ),
          const SizedBox(height: 12),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
            children: [
              Container(),
              _KeypadButton(
                label: "0",
                onTap: () => _onKeyPressed(viewModel, "0"),
              ),
              GestureDetector(
                onTap: viewModel.removeDigit,
                child: const Icon(Icons.backspace),
              ),
            ],
          ),
        ],
      ),
    );
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

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).push('/create_account'),
            child: const Text(
              "BAG-ONG ACCOUNT",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => GoRouter.of(context).push('/forgot_pin'),
            child: const Text(
              "NAKALIMOT SA PIN?",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  const _KeypadButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 51),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
