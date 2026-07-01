import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/channel_plan_section.dart';
import 'package:sotong_contents_promo/widgets/contact_section.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/content_project_card.dart';
import 'package:sotong_contents_promo/widgets/footer_section.dart';
import 'package:sotong_contents_promo/widgets/hero_section.dart';
import 'package:sotong_contents_promo/widgets/monetization_section.dart';
import 'package:sotong_contents_promo/widgets/production_process_section.dart';
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
                    const SectionTitle(title: '소통웨어가 만드는 콘텐츠의 방향'),
                    const SizedBox(height: 40),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = PromoTheme.gridCrossAxisCount(
                          context,
                          max: 3,
                        );
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 24,
                                childAspectRatio: crossAxisCount == 1
                                    ? 0.9
                                    : 0.95,
                              ),
                          itemCount:
                              SampleContentsData.contentDirections.length,
                          itemBuilder: (context, index) {
                            return ContentDirectionCard(
                              direction:
                                  SampleContentsData.contentDirections[index],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                sectionKey: _portfolioKey,
                backgroundColor: PromoTheme.surfaceDark.withValues(alpha: 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: '콘텐츠 포트폴리오'),
                    const SizedBox(height: 40),
                    ...SampleContentsData.portfolioProjects.map(
                      (project) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
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
                    const SectionTitle(title: '확장 가능한 콘텐츠 카테고리'),
                    const SizedBox(height: 16),
                    Text(
                      '새로운 콘텐츠와 채널을 계속 추가할 수 있는 확장형 구조입니다.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: PromoTheme.textMuted,
                      ),
                    ),
                    const SizedBox(height: 40),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = PromoTheme.gridCrossAxisCount(
                          context,
                          max: 4,
                        );
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: crossAxisCount == 1
                                    ? 1.4
                                    : 1.1,
                              ),
                          itemCount:
                              SampleContentsData.expandableCategories.length,
                          itemBuilder: (context, index) {
                            return ContentCategoryCard(
                              category: SampleContentsData
                                  .expandableCategories[index],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(child: ProductionProcessSection()),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                backgroundColor: PromoTheme.surfaceDark.withValues(alpha: 0.5),
                child: const ChannelPlanSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(child: BusinessConnectionSection()),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                backgroundColor: PromoTheme.surfaceDark.withValues(alpha: 0.5),
                child: const MonetizationSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionContainer(child: FutureIdeasSection()),
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
