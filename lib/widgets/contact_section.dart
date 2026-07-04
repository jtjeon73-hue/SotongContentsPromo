import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/promo_contact.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, this.sectionKey});

  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PromoTheme.surfaceCard,
            PromoTheme.purpleDeep.withValues(alpha: 0.35),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: PromoTheme.purple.withValues(alpha: 0.35)),
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width < 600 ? 24 : 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: PromoTheme.goldLight.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'SOTONG HUB · CONTENTS INQUIRY',
              style: TextStyle(
                color: PromoTheme.goldLight,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle(
            title: '콘텐츠 제작 및 협업 문의',
            subtitle:
                '문의는 소통총관제로 접수되어 검토·피드백·후속 지시까지 연계됩니다. '
                'AI 음악, YouTube·숏폼 영상, 지역 생활 콘텐츠, 앱 홍보 영상, '
                '채널 기획·콘텐츠 기획 관련 상담을 받을 수 있습니다.',
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 28),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              const Icon(
                Icons.email_outlined,
                color: PromoTheme.teal,
                size: 22,
              ),
              SelectableText(
                PromoContact.email,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: PromoTheme.teal),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => launchUrl(PromoContact.hubInquiryUri()),
                icon: const Icon(Icons.hub_outlined, size: 20),
                label: const Text('소통총관제 상담 문의'),
              ),
              OutlinedButton.icon(
                onPressed: () => launchUrl(PromoContact.hubCollaborationUri()),
                style: OutlinedButton.styleFrom(
                  foregroundColor: PromoTheme.offWhite,
                  side: const BorderSide(color: PromoTheme.goldLight),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                ),
                icon: const Icon(Icons.handshake_outlined, size: 20),
                label: const Text('협업 · 콘텐츠 기획 제안'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
