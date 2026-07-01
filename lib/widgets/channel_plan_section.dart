import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/models/channel_plan.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class ChannelPlanSection extends StatelessWidget {
  const ChannelPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: '채널 운영 계획',
          subtitle: 'AI 음악, 지역 생활, 앱 홍보, 브랜드 채널 운영 방향입니다.',
        ),
        const SizedBox(height: 40),
        ResponsiveCardGrid(
          itemCount: SampleContentsData.channelPlans.length,
          minCardWidth: 340,
          maxColumns: 2,
          itemBuilder: (context, index) =>
              _ChannelPlanCard(plan: SampleContentsData.channelPlans[index]),
        ),
      ],
    );
  }
}

class _ChannelPlanCard extends StatelessWidget {
  const _ChannelPlanCard({required this.plan});

  final ChannelPlan plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: plan.accentColor.withValues(alpha: 0.15),
                ),
                child: Icon(plan.icon, color: plan.accentColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  plan.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            plan.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.65),
            softWrap: true,
          ),
          const SizedBox(height: 18),
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
          const SizedBox(height: 16),
          _PlanDetail(
            label: '업로드 방향',
            value: plan.uploadDirection,
            color: PromoTheme.teal,
          ),
          const SizedBox(height: 12),
          _PlanDetail(
            label: '수익화 가능성',
            value: plan.monetization,
            color: PromoTheme.purple,
          ),
        ],
      ),
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
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.6),
          softWrap: true,
        ),
      ],
    );
  }
}
