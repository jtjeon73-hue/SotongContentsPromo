import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/models/channel_plan.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class ProductionProcessSection extends StatelessWidget {
  const ProductionProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = SampleContentsData.productionSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: '콘텐츠 제작 흐름',
          subtitle: 'AI 음악과 영상 콘텐츠를 만드는 7단계 과정입니다.',
        ),
        const SizedBox(height: 40),
        Column(
          children: [
            for (int i = 0; i < steps.length; i++) ...[
              _StepCard(step: steps[i]),
              if (i < steps.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const SizedBox(width: 22),
                      Container(
                        width: 2,
                        height: 24,
                        color: PromoTheme.teal.withValues(alpha: 0.35),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.step});

  final ProductionStep step;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: PromoTheme.accentGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: PromoTheme.teal.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${step.step}',
                style: const TextStyle(
                  color: PromoTheme.richBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                ),
                const SizedBox(height: 10),
                Text(
                  step.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.65,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
