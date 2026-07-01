import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class MyCvPage extends StatelessWidget {
  const MyCvPage({super.key});

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // CV Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.border),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 52, height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.description_outlined, color: AppColors.primary, size: 28),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_outline, size: 14, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text('Default', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('My CV', style: AppTextStyles.heading1.copyWith(fontSize: 26)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 6),
                    Text('June 9, 2026', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 20),
                // Completion header
                Text('PROFILE COMPLETION', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, letterSpacing: 1.1)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('100%', style: AppTextStyles.caption.copyWith(color: AppColors.success, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                // Progress sections
                Row(
                  children: ['Education', 'Experience', 'Skills', 'Languages']
                      .map((label) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Column(
                                children: [
                                  Container(
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: AppColors.success,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(label, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                CustomButton(text: '  Edit CV', onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Stats Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _buildStatCard(icon: Icons.school_outlined, value: '2', label: 'Education'),
              _buildStatCard(icon: Icons.work_outline, value: '5', label: 'Experience'),
              _buildStatCard(icon: Icons.bolt_outlined, value: '24', label: 'Skills'),
              _buildStatCard(icon: Icons.language_outlined, value: '3', label: 'Languages'),
            ],
          ),
          const SizedBox(height: 24),
          // Education Section
          _buildSectionHeader(icon: Icons.school_outlined, label: 'EDUCATION', count: '2'),
          const SizedBox(height: 12),
          _buildTimelineItem(
            title: 'Arid Agriculture University Rawalpindi',
            subtitle: "Bachelor's · Information Technology",
            detail: '2020 · GPA 3.2',
            isFirst: true,
          ),
          const SizedBox(height: 12),
          _buildTimelineItem(
            title: 'Punjab College Rawalpindi',
            subtitle: 'Intermediate · Pre-Engineering',
            detail: '2018',
          ),
          const SizedBox(height: 24),
          // Experience Section
          _buildSectionHeader(icon: Icons.work_outline, label: 'EXPERIENCE', count: '5'),
          const SizedBox(height: 12),
          _buildTimelineItem(
            title: 'Senior Flutter Developer',
            subtitle: 'Tech Solutions Co.',
            detail: '2022 – Present',
            isFirst: true,
          ),
          const SizedBox(height: 12),
          _buildTimelineItem(
            title: 'Flutter Developer',
            subtitle: 'Digital Hub',
            detail: '2020 – 2022',
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildStatCard({required IconData icon, required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
              Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
            ],
          ),
          Text(value, style: AppTextStyles.heading1.copyWith(fontSize: 28)),
          Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required IconData icon, required String label, required String count}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.1))),
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(count, style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({required String title, required String subtitle, required String detail, bool isFirst = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12, height: 12,
              decoration: BoxDecoration(
                color: isFirst ? AppColors.primary : AppColors.border,
                shape: BoxShape.circle,
                border: Border.all(color: isFirst ? AppColors.primary : AppColors.border, width: 2),
              ),
            ),
            Container(width: 1, height: 60, color: AppColors.border),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(detail, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
