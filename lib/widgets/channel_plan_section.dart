import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class ChannelPlanSection extends StatelessWidget {
  const ChannelPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = PromoTheme.gridCrossAxisCount(context, max: 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: '채널 운영 계획'),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: crossAxisCount == 1 ? 0.85 : 0.95,
          ),
          itemCount: SampleContentsData.channelPlans.length,
          itemBuilder: (context, index) {
            final plan = SampleContentsData.channelPlans[index];
            return Container(
              decoration: PromoTheme.cardDecoration,
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: plan.accentColor.withValues(alpha: 0.15),
                        ),
                        child: Icon(
                          plan.icon,
                          color: plan.accentColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          plan.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    plan.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  _PlanDetail(
                    label: '채널 목적',
                    value: plan.purpose,
                    color: plan.accentColor,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '콘텐츠 예시',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: PromoTheme.gold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: plan.examples
                        .map(
                          (e) => Chip(
                            label: Text(e),
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                        .toList(),
                  ),
                  const Spacer(),
                  const SizedBox(height: 16),
                  _PlanDetail(
                    label: '업로드 방향',
                    value: plan.uploadDirection,
                    color: PromoTheme.teal,
                  ),
                  const SizedBox(height: 10),
                  _PlanDetail(
                    label: '수익화 가능성',
                    value: plan.monetization,
                    color: PromoTheme.purple,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _PlanDetail extends StatelessWidget {
  const _PlanDetail({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: color, fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
