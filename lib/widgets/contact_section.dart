import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, this.sectionKey});

  final Key? sectionKey;

  static final Uri _mailtoUri = Uri(
    scheme: 'mailto',
    path: SampleContentsData.contactEmail,
    query: 'subject=${Uri.encodeComponent('소통웨어 콘텐츠 문의')}',
  );

  Future<void> _launchEmail() async {
    if (await canLaunchUrl(_mailtoUri)) {
      await launchUrl(_mailtoUri);
    }
  }

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
            PromoTheme.purpleDeep.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: PromoTheme.purple.withValues(alpha: 0.3)),
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width < 600 ? 24 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: '콘텐츠 제작 및 협업 문의'),
          const SizedBox(height: 20),
          Text(
            'AI 음악, 지역 생활 영상, 앱 홍보 영상, 브랜드 콘텐츠, 쇼츠 콘텐츠 제작과 관련된 문의를 받을 수 있습니다.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              const Icon(
                Icons.email_outlined,
                color: PromoTheme.teal,
                size: 22,
              ),
              SelectableText(
                SampleContentsData.contactEmail,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: PromoTheme.teal),
              ),
            ],
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: _launchEmail,
            icon: const Icon(Icons.send_rounded, size: 20),
            label: const Text('이메일 문의하기'),
          ),
        ],
      ),
    );
  }
}
