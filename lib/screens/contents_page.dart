import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/content_project_card.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class ContentsPage extends StatelessWidget {
  const ContentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '전체 콘텐츠',
                subtitle: '기획·제작 준비 중인 콘텐츠 프로젝트와 확장 카테고리입니다.',
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
          alternate: true,
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
      ],
    );
  }
}
