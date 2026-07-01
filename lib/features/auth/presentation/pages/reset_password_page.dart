import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/gradient_background.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shield_outlined,
                          color: AppColors.primary,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Create New Password',
                        style: AppTextStyles.heading1,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Your new password must be different from previous used passwords.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle,
                      ),
                      const SizedBox(height: 48),
                      const CustomTextField(
                        labelText: 'New Password',
                        hintText: 'Enter new password',
                        isPassword: true,
                        prefixIcon: Icon(Icons.lock_outline, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 24),
                      const CustomTextField(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        isPassword: true,
                        prefixIcon: Icon(Icons.lock_outline, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: 'Reset Password',
                        onPressed: () {
                          // TODO: Handle reset password success and navigate to login
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
