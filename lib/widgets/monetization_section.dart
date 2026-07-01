import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/models/channel_plan.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class MonetizationSection extends StatelessWidget {
  const MonetizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = PromoTheme.gridCrossAxisCount(context, max: 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: '콘텐츠 수익화 방향'),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: crossAxisCount == 1 ? 1.6 : 1.1,
          ),
          itemCount: SampleContentsData.monetizationItems.length,
          itemBuilder: (context, index) {
            final item = SampleContentsData.monetizationItems[index];
            return _MonetizationCard(item: item);
          },
        ),
      ],
    );
  }
}

class BusinessConnectionSection extends StatelessWidget {
  const BusinessConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = PromoTheme.gridCrossAxisCount(context, max: 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: '콘텐츠와 사업 연결 구조',
          subtitle:
              '소통웨어 콘텐츠는 단순 조회수만 목표로 하지 않고, '
              '앱, 전자책, 스마트스토어, 산업자동화 홍보, 지역 브랜드와 연결되는 수익형 구조를 목표로 합니다.',
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: crossAxisCount == 1 ? 2.2 : 1.3,
          ),
          itemCount: SampleContentsData.businessLinks.length,
          itemBuilder: (context, index) {
            final link = SampleContentsData.businessLinks[index];
            return Container(
              decoration: PromoTheme.cardDecoration,
              padding: const EdgeInsets.all(22),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: link.accentColor.withValues(alpha: 0.15),
                    ),
                    child: Icon(link.icon, color: link.accentColor, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          link.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          link.description,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
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

class FutureIdeasSection extends StatelessWidget {
  const FutureIdeasSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = PromoTheme.gridCrossAxisCount(context, max: 4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: '계속 확장되는 콘텐츠 아이디어'),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: crossAxisCount == 1 ? 2.8 : 1.6,
          ),
          itemCount: SampleContentsData.futureIdeas.length,
          itemBuilder: (context, index) {
            final idea = SampleContentsData.futureIdeas[index];
            return Container(
              decoration: PromoTheme.cardDecoration.copyWith(
                border: Border.all(
                  color: idea.accentColor.withValues(alpha: 0.2),
                ),
              ),
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(idea.icon, color: idea.accentColor, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      idea.title,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 15),
                    ),
                  ),
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: PromoTheme.teal.withValues(alpha: 0.6),
                    size: 20,
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

class _MonetizationCard extends StatelessWidget {
  const _MonetizationCard({required this.item});

  final MonetizationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: item.accentColor.withValues(alpha: 0.15),
            ),
            child: Icon(item.icon, color: item.accentColor, size: 24),
          ),
          const SizedBox(height: 18),
          Text(item.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Text(
            item.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
