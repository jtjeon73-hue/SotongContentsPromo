import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/models/channel_plan.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class MonetizationSection extends StatelessWidget {
  const MonetizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: '콘텐츠 수익화 방향',
          subtitle: '콘텐츠를 중심으로 확장 가능한 수익화 방향을 정리합니다.',
        ),
        const SizedBox(height: 40),
        ResponsiveCardGrid(
          itemCount: SampleContentsData.monetizationItems.length,
          minCardWidth: 300,
          itemBuilder: (context, index) => _MonetizationCard(
            item: SampleContentsData.monetizationItems[index],
          ),
        ),
      ],
    );
  }
}

class BusinessConnectionSection extends StatelessWidget {
  const BusinessConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
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
        ResponsiveCardGrid(
          itemCount: SampleContentsData.businessLinks.length,
          minCardWidth: 300,
          itemBuilder: (context, index) {
            final link = SampleContentsData.businessLinks[index];
            return Container(
              width: double.infinity,
              decoration: PromoTheme.cardDecoration,
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          link.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          softWrap: true,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          link.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontSize: 14, height: 1.65),
                          softWrap: true,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: '계속 확장되는 콘텐츠 아이디어',
          subtitle: '앞으로 제작을 검토할 콘텐츠 아이디어 목록입니다.',
        ),
        const SizedBox(height: 40),
        ResponsiveCardGrid(
          itemCount: SampleContentsData.futureIdeas.length,
          minCardWidth: 280,
          maxColumns: 3,
          itemBuilder: (context, index) {
            final idea = SampleContentsData.futureIdeas[index];
            return Container(
              width: double.infinity,
              decoration: PromoTheme.cardDecoration.copyWith(
                border: Border.all(
                  color: idea.accentColor.withValues(alpha: 0.2),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(idea.icon, color: idea.accentColor, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      idea.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                        height: 1.5,
                      ),
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(width: 8),
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
                  color: item.accentColor.withValues(alpha: 0.15),
                ),
                child: Icon(item.icon, color: item.accentColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.65),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
