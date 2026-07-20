import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/production_process_section.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '소통콘텐츠 소개',
                subtitle: 'AI 음악, 지역 영상, 앱 홍보까지 연결하는 콘텐츠 사업 방향입니다.',
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
        const SectionContainer(
          alternate: true,
          child: ProductionProcessSection(),
        ),
      ],
    );
  }
}
