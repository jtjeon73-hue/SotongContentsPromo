import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/widgets/channel_plan_section.dart';
import 'package:sotong_contents_promo/widgets/contact_section.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/content_project_card.dart';
import 'package:sotong_contents_promo/widgets/footer_section.dart';
import 'package:sotong_contents_promo/widgets/hero_section.dart';
import 'package:sotong_contents_promo/widgets/monetization_section.dart';
import 'package:sotong_contents_promo/widgets/production_process_section.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _directionKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: HeroSection(
                onViewDirection: () => _scrollTo(_directionKey),
                onViewPortfolio: () => _scrollTo(_portfolioKey),
                onContact: () => _scrollTo(_contactKey),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                sectionKey: _directionKey,
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
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                sectionKey: _portfolioKey,
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
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
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
                        category:
                            SampleContentsData.expandableCategories[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(
                alternate: true,
                child: ProductionProcessSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(child: ChannelPlanSection()),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(
                alternate: true,
                child: BusinessConnectionSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(child: MonetizationSection()),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(
                alternate: true,
                child: FutureIdeasSection(),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                child: ContactSection(sectionKey: _contactKey),
              ),
            ),
            const SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}
