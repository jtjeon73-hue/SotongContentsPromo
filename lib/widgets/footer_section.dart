import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      color: PromoTheme.richBlack,
      padding: EdgeInsets.symmetric(
        horizontal: PromoTheme.horizontalPadding(context),
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                SampleContentsData.siteName,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: PromoTheme.offWhite),
              ),
              const SizedBox(height: 8),
              Text(
                SampleContentsData.siteNameEn,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PromoTheme.gold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'AI Music / YouTube Contents / Local Life Video / App Promo Video',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PromoTheme.textMuted,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Contact: ${SampleContentsData.contactEmail}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PromoTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Public Promo Site',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PromoTheme.textMuted,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(color: Color(0xFF1E293B)),
              const SizedBox(height: 16),
              Text(
                '© $year Sotong Contents Lab. All rights reserved.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PromoTheme.textMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
