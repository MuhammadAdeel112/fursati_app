import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'contact_us_page.dart';
import 'my_cv_page.dart';
import 'my_plan_page.dart';
import 'policy_page.dart';
import '../../../auth/presentation/pages/login_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          const SizedBox(height: 20),
          // Profile Card
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 52, height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hanad Muqadar', style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('user@fursatipro.com', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          _buildSectionLabel('ACCOUNT'),
          const SizedBox(height: 12),
          _buildMenuGroup(context, [
            _MenuItem(icon: Icons.credit_card_outlined, label: 'My Plan', onTap: () => _nav(context, const MyPlanPage())),
            _MenuItem(icon: Icons.description_outlined, label: 'My CV', onTap: () => _nav(context, const MyCvPage())),
            _MenuItem(icon: Icons.manage_accounts_outlined, label: 'Manage Account', onTap: () {}),
            _MenuItem(icon: Icons.mail_outline, label: 'Contact Us', onTap: () => _nav(context, const ContactUsPage())),
          ]),
          const SizedBox(height: 24),
          _buildSectionLabel('PREFERENCES'),
          const SizedBox(height: 12),
          _buildMenuGroup(context, [
            _MenuItem(icon: Icons.language_outlined, label: 'App Language', onTap: () {}),
          ]),
          const SizedBox(height: 24),
          _buildSectionLabel('LEGAL & DATA'),
          const SizedBox(height: 12),
          _buildMenuGroup(context, [
            _MenuItem(icon: Icons.security_outlined, label: 'Security & Privacy', onTap: () => _nav(context, PolicyPage(
              title: 'Privacy Policy',
              updatedDate: 'May 2026',
              sections: _privacyPolicySections,
            ))),
            _MenuItem(icon: Icons.info_outline, label: 'About FursatiPro', onTap: () => _nav(context, PolicyPage(
              title: 'Service Description',
              updatedDate: 'May 2026',
              sections: _serviceDescSections,
            ))),
            _MenuItem(icon: Icons.receipt_long_outlined, label: 'Refund Policy', onTap: () => _nav(context, PolicyPage(
              title: 'Refund, Replacement & Upgrade Policy',
              updatedDate: 'June 2026',
              sections: _refundPolicySections,
            ))),
            _MenuItem(icon: Icons.delete_outline, label: 'Delete Account', onTap: () {}, isDestructive: true),
          ]),
          const SizedBox(height: 24),
          // Log Out Button
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: AppColors.error, size: 18),
                  const SizedBox(width: 10),
                  Text('Log Out', style: AppTextStyles.bodyText.copyWith(color: AppColors.error, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text('Version 1.0.0', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          ),
          const SizedBox(height: 32),
        ],
      );
  }

  void _nav(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: AppTextStyles.caption.copyWith(
        color: AppColors.textSecondary,
        letterSpacing: 1.2,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMenuGroup(BuildContext context, List<_MenuItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.vertical(
                  top: i == 0 ? const Radius.circular(20) : Radius.zero,
                  bottom: i == items.length - 1 ? const Radius.circular(20) : Radius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        width: 38, height: 38,
                        decoration: BoxDecoration(
                          color: item.isDestructive
                              ? AppColors.error.withValues(alpha: 0.1)
                              : AppColors.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(item.icon, size: 18, color: item.isDestructive ? AppColors.error : AppColors.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item.label,
                          style: AppTextStyles.bodyText.copyWith(
                            color: item.isDestructive ? AppColors.error : AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, color: item.isDestructive ? AppColors.error : AppColors.textSecondary, size: 20),
                    ],
                  ),
                ),
              ),
              if (i < items.length - 1) const Divider(height: 1, indent: 70, color: AppColors.border),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  _MenuItem({required this.icon, required this.label, required this.onTap, this.isDestructive = false});
}

// --- Policy Content ---

final List<PolicySection> _privacyPolicySections = [
  const PolicySection(
    number: '1',
    heading: 'Collected Information',
    body: 'We may collect the following information when you use the service:',
    bullets: [
      'Personal information such as: name, phone number, email, current salary, university degree, work experience, nationality, city.',
      'Account data such as: username and encrypted password.',
      'Payment data is processed through certified payment service providers in the Kingdom of Saudi Arabia.',
      'Usage data such as: login records, pages visited, and device type.',
    ],
  ),
  const PolicySection(
    number: '2',
    heading: 'Use of Information',
    body: 'We use the information collected for the following purposes:',
    bullets: [
      'Providing and operating the service correctly.',
      'Managing the user\'s account.',
      'Sending notifications about new job opportunities.',
      'Improving platform performance and user experience.',
    ],
  ),
  const PolicySection(
    number: '3',
    heading: 'Data Protection',
    body: 'We are committed to protecting your data using industry-standard security measures including encryption and secure servers.',
  ),
];

final List<PolicySection> _serviceDescSections = [
  const PolicySection(
    heading: 'For Job Seekers:',
    bullets: [
      'Discover thousands of varied job opportunities across different specialities easily.',
      'FursatiPro offers direct and safe access to employers and provides advanced tools to apply.',
      'Filter opportunities based on the skills, qualifications and disciplines of the best employer.',
    ],
  ),
  const PolicySection(
    heading: 'For Employers:',
    bullets: [
      'Reach a wide segment of qualified candidates accurately and quickly.',
      'Manage job postings and apply through an effective system that accelerates recruitment processes with high quality.',
      'Choose the right candidates based on hiring criteria, qualifications and disciplines that match the job requirements.',
    ],
  ),
  const PolicySection(
    heading: 'Why choose FursatiPro?',
    bullets: [
      'User-friendly experience and an integrated platform that brings together everything you need.',
      'Fast support for both job seekers and employers when needed.',
    ],
  ),
];

final List<PolicySection> _refundPolicySections = [
  const PolicySection(
    heading: 'First: Service Definition',
    bullets: [
      'FursatiPro platform offers electronic (digital) services activated via the internet. The customer acknowledges that these services are intangible.',
      'Services are consumed upon activation or use and cannot be refunded after activation.',
    ],
  ),
  const PolicySection(
    heading: 'Second: Acknowledgment & Consent',
    body: 'By completing a purchase, the customer acknowledges the following:',
    bullets: [
      'Full review of the service description and its content before purchase.',
      'Understanding the nature of the electronic service.',
      'Agreement to the no-refund policy after activation.',
      'Taking responsibility for the purchase decision.',
    ],
  ),
  const PolicySection(
    heading: 'Third: Refund Before Activation',
    body: 'The customer may request a refund of the paid amount before service activation, subject to the following conditions:',
    bullets: [
      'Submitting the request within no more than 2 (two) days from the date of purchase.',
      'The service has not been activated or used in any way.',
    ],
  ),
];
