import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  int _selectedTabIndex = 0; // 0 for Applied, 1 for Skipped

  // Dummy data
  final List<Map<String, dynamic>> _appliedJobs = [
    {
      'company': 'Mirai Arabian International',
      'title': 'Senior Data Engineer',
      'location': 'Riyadh, Saudi Arabia',
      'status': 'Applied',
      'time': 'Today',
    },
    {
      'company': 'Mirai Arabian International',
      'title': 'Director of AI',
      'location': 'Riyadh, Saudi Arabia',
      'status': 'Applied',
      'time': 'Today',
    },
    {
      'company': 'Master Works',
      'title': 'AI Solution Engineer',
      'location': 'Riyadh, Saudi Arabia',
      'status': 'Applied',
      'time': 'Today',
    },
    {
      'company': 'Salla',
      'title': 'Senior Data Scientist',
      'location': 'TELECOMMUTE',
      'status': 'Applied',
      'time': 'Yesterday',
    },
  ];

  final List<Map<String, dynamic>> _skippedJobs = [
    {
      'company': 'Mirai Arabian International',
      'title': 'Senior DevOps Engineer',
      'location': 'Riyadh, Saudi Arabia',
      'time': '0 days ago',
    },
    {
      'company': 'Delivery Hero',
      'title': 'Product Operations Senior Specialist',
      'location': 'Riyadh, sa',
      'time': '3 days ago',
    },
    {
      'company': 'Jobs for Humanity',
      'title': 'Python Developer - Riyadh',
      'location': 'Riyadh, sa',
      'time': '3 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'MY JOBS',
            style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jobs',
                style: AppTextStyles.heading1.copyWith(fontSize: 32),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.success.withValues(alpha: 0.5)),
                ),
                child: Text(
                  'Reviewed 30 jobs',
                  style: AppTextStyles.caption.copyWith(color: AppColors.success, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Custom Tab Bar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedTabIndex == 0 ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Applied (22)',
                        style: AppTextStyles.bodyText.copyWith(
                          color: _selectedTabIndex == 0 ? Colors.white : AppColors.textSecondary,
                          fontWeight: _selectedTabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedTabIndex == 1 ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Skipped (8)',
                        style: AppTextStyles.bodyText.copyWith(
                          color: _selectedTabIndex == 1 ? Colors.white : AppColors.textSecondary,
                          fontWeight: _selectedTabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: _selectedTabIndex == 0 ? _buildAppliedView() : _buildSkippedView(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter Chips
        Row(
          children: [
            _buildFilterChip('All', isSelected: true),
            const SizedBox(width: 8),
            _buildFilterChip('Applied 11', icon: Icons.check_circle_outline),
            const SizedBox(width: 8),
            _buildFilterChip('Position filled 11', icon: Icons.block),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'RECENT APPLICATIONS',
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, letterSpacing: 1.2),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: _appliedJobs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final job = _appliedJobs[index];
              return _buildAppliedJobCard(job);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSkippedView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SKIPPED JOBS',
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, letterSpacing: 1.2),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: _skippedJobs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final job = _skippedJobs[index];
              return _buildSkippedJobCard(job);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String text, {bool isSelected = false, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.textPrimary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.textPrimary : AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: isSelected ? Colors.white : AppColors.textSecondary),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedJobCard(Map<String, dynamic> job) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(Icons.business, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  job['company'],
                  style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      job['location'],
                      style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                ),
                child: Text(
                  job['status'],
                  style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                job['time'],
                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Tap for details',
                    style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10),
                  ),
                  const Icon(Icons.chevron_right, size: 14, color: AppColors.textSecondary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkippedJobCard(Map<String, dynamic> job) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Icon(Icons.business, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title'],
                      style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job['company'],
                      style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          job['location'],
                          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                job['time'],
                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  'View',
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.success),
                ),
                child: Text(
                  'Apply',
                  style: AppTextStyles.bodyText.copyWith(color: AppColors.success, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
