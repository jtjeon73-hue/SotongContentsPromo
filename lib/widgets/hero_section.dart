import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onViewDirection,
    required this.onViewPortfolio,
    required this.onContact,
  });

  final VoidCallback onViewDirection;
  final VoidCallback onViewPortfolio;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final isNarrow = MediaQuery.sizeOf(context).width < 600;
    final padding = PromoTheme.horizontalPadding(context);

    return Container(
      width: double.infinity,
      decoration: PromoTheme.heroGradient,
      child: Stack(
        children: [
          Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    PromoTheme.purple.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    PromoTheme.teal.withValues(alpha: 0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              padding,
              isNarrow ? 72 : 96,
              padding,
              isNarrow ? 56 : 80,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: PromoTheme.gold.withValues(alpha: 0.5),
                        ),
                        color: PromoTheme.gold.withValues(alpha: 0.1),
                      ),
                      child: Text(
                        SampleContentsData.siteNameEn,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: PromoTheme.gold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      SampleContentsData.siteName,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: isWide ? 52 : 36,
                        color: PromoTheme.offWhite,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          PromoTheme.accentGradient.createShader(bounds),
                      child: Text(
                        'AI 음악과 지역 생활 영상을 콘텐츠 자산으로 만듭니다',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontSize: isWide ? 24 : 20,
                            ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Text(
                        '소통웨어 콘텐츠는 AI 음악, 지역 생활밀착 영상, 시골 생활 콘텐츠, 앱 홍보 영상, 쇼츠 콘텐츠를 결합하여 '
                        '사람들이 공감하고 공유할 수 있는 콘텐츠를 기획하고 제작하는 콘텐츠 사업입니다. '
                        '음악, 영상, 앱, 지역 이야기, 전자책, 스마트스토어까지 연결되는 수익형 콘텐츠 생태계를 목표로 합니다.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFCBD5E1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton(
                          onPressed: onViewDirection,
                          child: const Text('콘텐츠 방향 보기'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: PromoTheme.offWhite,
                            side: const BorderSide(color: Color(0xFF64748B)),
                          ),
                          onPressed: onViewPortfolio,
                          child: const Text('제작 예정 콘텐츠 보기'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: PromoTheme.offWhite,
                            side: const BorderSide(color: Color(0xFF64748B)),
                          ),
                          onPressed: onContact,
                          child: const Text('문의하기'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: SampleContentsData.heroBadges.map((badge) {
                        return Chip(
                          label: Text(badge),
                          avatar: Icon(
                            Icons.circle,
                            size: 8,
                            color: PromoTheme.teal.withValues(alpha: 0.8),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
