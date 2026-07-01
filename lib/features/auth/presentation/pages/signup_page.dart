import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/gradient_background.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                      Text(
                        'FursatiPro',
                        style: AppTextStyles.heading1.copyWith(
                          color: AppColors.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Create Your Account',
                        style: AppTextStyles.heading1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter your details to get started',
                        style: AppTextStyles.subtitle,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      const SizedBox(height: 48),
                      const CustomTextField(
                        labelText: 'First Name',
                        hintText: 'Enter your first name',
                      ),
                      const SizedBox(height: 24),
                      const CustomTextField(
                        labelText: 'Last Name',
                        hintText: 'Enter your last name',
                      ),
                      const SizedBox(height: 24),
                      const CustomTextField(
                        labelText: 'Phone Number',
                        hintText: '5XX XXX XXXX',
                        prefixText: '+966 | ',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          // TODO: Navigate to OTP page
                        },
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Sign In',
                              style: AppTextStyles.link.copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
