import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColors.textPrimary),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Text('Contact Us', style: AppTextStyles.heading1.copyWith(fontSize: 28)),
                const SizedBox(height: 8),
                Text(
                  "We'd love to hear from you. Reach our team by email or on social media.",
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary, height: 1.5),
                ),
                const SizedBox(height: 28),
                // Email Card
                _buildContactCard(
                  child: Row(
                    children: [
                      Container(
                        width: 44, height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.email_outlined, color: AppColors.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email us', style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              'We typically respond within one business day',
                              style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: 6),
                            Text('Info@FursatiPro.SA', style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'FOLLOW US',
                  style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, letterSpacing: 1.2, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildContactCard(
                  child: Column(
                    children: [
                      _buildSocialRow(icon: Icons.close, label: 'X (Twitter)', handle: '@fursatipro', color: Colors.black),
                      _buildDivider(),
                      _buildSocialRow(icon: Icons.camera_alt_outlined, label: 'Instagram', handle: '@fursatipro', color: const Color(0xFFE1306C)),
                      _buildDivider(),
                      _buildSocialRow(icon: Icons.music_note_outlined, label: 'TikTok', handle: '@fursatiproapp', color: Colors.black),
                      _buildDivider(),
                      _buildSocialRow(icon: Icons.link, label: 'LinkedIn', handle: 'fursatipro-co', color: const Color(0xFF0077B5)),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: MediaQuery.of(context).padding.bottom + 16, top: 12),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryLight, AppColors.primaryDark],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            icon: const Icon(Icons.send, color: Colors.white, size: 18),
            label: const Text('Send us a message', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }

  Widget _buildSocialRow({required IconData icon, required String label, required String handle, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w600)),
                Text(handle, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: AppColors.border, height: 1);
  }
}
