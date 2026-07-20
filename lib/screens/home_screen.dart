import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/widgets/channel_plan_section.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/content_project_card.dart';
import 'package:sotong_contents_promo/widgets/hero_section.dart';
import 'package:sotong_contents_promo/widgets/monetization_section.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/production_process_section.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';
import 'package:sotong_contents_promo/widgets/sotong_control_hub_section.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        HeroSection(
          onViewDirection: () => context.go('/about'),
          onViewPortfolio: () => context.go('/contents'),
          onContact: () => context.go('/contact'),
        ),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '소통웨어가 만드는 콘텐츠의 방향',
                subtitle: 'AI 음악, 지역 영상, 앱 홍보까지 연결하는 6가지 콘텐츠 영역입니다.',
              ),
              const SizedBox(height: 40),
              ResponsiveCardGrid(
                itemCount: SampleContentsData.contentDirections.length,
                minCardWidth: 320,
                itemBuilder: (context, index) => ContentDirectionCard(
                  direction: SampleContentsData.contentDirections[index],
                ),
              ),
            ],
          ),
        ),
        SectionContainer(
          alternate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '콘텐츠 포트폴리오',
                subtitle: '기획 중·준비 중인 콘텐츠 프로젝트입니다.',
              ),
              const SizedBox(height: 40),
              ...SampleContentsData.portfolioProjects.map(
                (project) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ContentProjectCard(project: project),
                ),
              ),
            ],
          ),
        ),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '확장 가능한 콘텐츠 카테고리',
                subtitle: '새로운 콘텐츠와 채널을 계속 추가할 수 있는 확장형 구조입니다.',
              ),
              const SizedBox(height: 40),
              ResponsiveCardGrid(
                itemCount: SampleContentsData.expandableCategories.length,
                minCardWidth: 220,
                maxColumns: 4,
                itemBuilder: (context, index) => ContentCategoryCard(
                  category: SampleContentsData.expandableCategories[index],
                ),
              ),
            ],
          ),
        ),
        const SectionContainer(
          alternate: true,
          child: ProductionProcessSection(),
        ),
        const SectionContainer(child: ChannelPlanSection()),
        const SectionContainer(
          alternate: true,
          child: BusinessConnectionSection(),
        ),
        const SectionContainer(child: MonetizationSection()),
        const SectionContainer(alternate: true, child: FutureIdeasSection()),
        const SotongControlHubSection(),
      ],
    );
  }
}
