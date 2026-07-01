import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class JobDiscoveryPage extends StatefulWidget {
  const JobDiscoveryPage({super.key});

  @override
  State<JobDiscoveryPage> createState() => _JobDiscoveryPageState();
}

class _JobDiscoveryPageState extends State<JobDiscoveryPage> {
  final List<Map<String, dynamic>> _jobs = [
    {
      'company': 'Qiddiya Investment Company',
      'location': 'Riyadh, Saudi Arabia',
      'level': 'Mid-level',
      'title': 'Senior Specialist - IT Security Design',
      'type': 'Full-time',
      'workplace': 'OnSite',
      'description':
          'Manage and administer the Microsoft Security suite, including Defender for Endpoint, Defender for Cloud Apps, DLP, Data Classification, and Information Protection.',
      'skills': ['Microsoft Security suite', 'Defender for Endpoint', 'Defender for Cloud Apps', '+9 more'],
    },
    {
      'company': 'Mirai Arabian International',
      'location': 'Riyadh, Saudi Arabia',
      'level': 'Senior',
      'title': 'Senior DevOps Engineer',
      'type': 'Full-time',
      'workplace': 'Remote',
      'description': 'Designing and implementing scalable, secure, and highly available cloud-based infrastructure.',
      'skills': ['Docker', 'Kubernetes', 'AWS', 'CI/CD'],
    },
  ];

  int _currentIndex = 0;

  void _onReject() => setState(() { if (_currentIndex < _jobs.length - 1) _currentIndex++; });
  void _onAccept() => setState(() { if (_currentIndex < _jobs.length - 1) _currentIndex++; });

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= _jobs.length) {
      return Center(
        child: Text(
          'No more jobs for today!',
          style: AppTextStyles.heading1.copyWith(color: AppColors.textSecondary),
        ),
      );
    }

    final job = _jobs[_currentIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Job Discovery', style: AppTextStyles.heading1),
          ),
          const SizedBox(height: 16),
          // Job Card — scrollable inside Expanded
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(color: AppColors.border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company Info Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: const Icon(Icons.business, color: AppColors.primary),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  job['company'],
                                  style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        job['location'],
                                        style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              job['level'],
                              style: AppTextStyles.caption.copyWith(
                                  color: AppColors.primary, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Job Title
                      Text(job['title'], style: AppTextStyles.heading1.copyWith(fontSize: 20)),
                      const SizedBox(height: 12),
                      // Tags
                      Row(
                        children: [
                          _buildTagIcon(Icons.work_outline, job['type']),
                          const SizedBox(width: 10),
                          _buildTagIcon(Icons.home_work_outlined, job['workplace']),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Description
                      Text(
                        job['description'],
                        style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary, height: 1.5),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 14),
                      // Skills Chips
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: (job['skills'] as List<String>)
                            .map((skill) => _buildSkillChip(skill))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Tap for details',
                            style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(icon: Icons.close, color: AppColors.error, onTap: _onReject),
              const SizedBox(width: 48),
              _buildActionButton(icon: Icons.check, color: AppColors.success, onTap: _onAccept),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTagIcon(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(text,
              style: AppTextStyles.caption
                  .copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(text, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
    );
  }

  Widget _buildActionButton(
      {required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.cardBackground,
          border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
          boxShadow: [
            BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Icon(icon, size: 32, color: color),
      ),
    );
  }
}
