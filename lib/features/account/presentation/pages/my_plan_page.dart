import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key});

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  int _selectedPeriod = 0; // 0=Monthly, 1=6 Months, 2=12 Months

  final List<_Period> _periods = [
    _Period(label: 'Monthly', saving: null),
    _Period(label: '6 Months', saving: 'Save 7%'),
    _Period(label: '12 Months', saving: 'Save 22%'),
  ];

  final List<_PlanData> _plans = [
    _PlanData(
      name: 'AutoPilot',
      badge: 'Best Value',
      badgeColor: Color(0xFFFF8C00),
      description: 'Apply while you sleep',
      monthlyPrice: 199,
      sixMonthPrice: 185,
      twelveMonthPrice: 155,
      features: ['10 daily / 150 monthly applications', 'AI applies on your behalf 24/7', 'Smart match & application reports', 'Priority support', 'Everything in PRO, plus more'],
      iconColor: Color(0xFFFF8C00),
      icon: Icons.memory,
    ),
    _PlanData(
      name: 'PRO',
      badge: 'Most Popular',
      badgeColor: AppColors.primary,
      description: 'Boost your job search',
      monthlyPrice: 89,
      sixMonthPrice: 83,
      twelveMonthPrice: 69,
      features: ['10 daily / 150 monthly applications', 'PRO badge on your profile', 'Application performance analytics', 'Advanced AI job matching'],
      iconColor: AppColors.primary,
      icon: Icons.workspace_premium_outlined,
    ),
    _PlanData(
      name: 'Free',
      badge: 'Current',
      badgeColor: AppColors.textSecondary,
      description: 'Get started for free',
      monthlyPrice: 0,
      sixMonthPrice: 0,
      twelveMonthPrice: 0,
      features: ['3 daily / 40 monthly applications', 'Browse all job listings', 'Basic profile'],
      iconColor: AppColors.textSecondary,
      icon: Icons.person_outline,
    ),
  ];

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
        title: Text('My Plan', style: AppTextStyles.heading1.copyWith(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Pay less when you commit longer. Cancel anytime.',
              style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Period Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: List.generate(_periods.length, (i) {
                  final p = _periods[i];
                  final isSelected = _selectedPeriod == i;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPeriod = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.textPrimary : Colors.transparent,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          children: [
                            Text(
                              p.label,
                              style: AppTextStyles.caption.copyWith(
                                color: isSelected ? Colors.white : AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (p.saving != null)
                              Text(
                                p.saving!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected ? AppColors.success : AppColors.success,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Best Offer badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: 14, color: AppColors.primary),
                const SizedBox(width: 6),
                Text('Best offer', style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Plans List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _plans.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) => _buildPlanCard(_plans[index]),
            ),
          ),
          // Manage Plan button
          Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, MediaQuery.of(context).padding.bottom + 16),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryLight, AppColors.primaryDark],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 6))],
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size(double.infinity, 56),
                ),
                icon: const Icon(Icons.open_in_new, color: Colors.white, size: 18),
                label: const Text('Manage Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(_PlanData plan) {
    final price = _selectedPeriod == 0
        ? plan.monthlyPrice
        : _selectedPeriod == 1
            ? plan.sixMonthPrice
            : plan.twelveMonthPrice;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan name + badge
          Row(
            children: [
              Text(plan.name, style: AppTextStyles.heading1.copyWith(fontSize: 22, color: plan.iconColor)),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: plan.badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: plan.badgeColor.withValues(alpha: 0.4)),
                ),
                child: Text(plan.badge, style: AppTextStyles.caption.copyWith(color: plan.badgeColor, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Text(plan.description, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          const Divider(height: 24, color: AppColors.border),
          // Price
          if (price > 0) ...[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$price ', style: AppTextStyles.heading1.copyWith(fontSize: 36)),
                  TextSpan(text: 'SAR/mo', style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            if (_selectedPeriod > 0)
              Text(
                'Billed ${price * (_selectedPeriod == 1 ? 6 : 12)} SAR every ${_selectedPeriod == 1 ? 6 : 12} months',
                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
              ),
          ] else
            Text('Free', style: AppTextStyles.heading1.copyWith(fontSize: 36)),
          const Divider(height: 24, color: AppColors.border),
          // Features
          ...plan.features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(Icons.check, size: 18, color: plan.iconColor),
                    const SizedBox(width: 10),
                    Expanded(child: Text(f, style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _Period {
  final String label;
  final String? saving;
  _Period({required this.label, this.saving});
}

class _PlanData {
  final String name, badge, description;
  final Color badgeColor, iconColor;
  final int monthlyPrice, sixMonthPrice, twelveMonthPrice;
  final List<String> features;
  final IconData icon;

  _PlanData({
    required this.name,
    required this.badge,
    required this.badgeColor,
    required this.description,
    required this.monthlyPrice,
    required this.sixMonthPrice,
    required this.twelveMonthPrice,
    required this.features,
    required this.iconColor,
    required this.icon,
  });
}
