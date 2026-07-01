import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: PromoTheme.gold,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontSize: _titleSize(context)),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: PromoTheme.textMuted,
              fontSize: _subtitleSize(context),
              height: 1.7,
            ),
          ),
        ],
      ],
    );
  }

  double _titleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 26;
    if (width < 900) return 30;
    return 32;
  }

  double _subtitleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 15 : 16;
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.alternate = false,
    this.sectionKey,
  });

  final Widget child;
  final bool alternate;
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      decoration: alternate
          ? PromoTheme.alternateSectionDecoration
          : PromoTheme.sectionDecoration,
      padding: EdgeInsets.symmetric(
        horizontal: PromoTheme.horizontalPadding(context),
        vertical: PromoTheme.verticalSectionPadding(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
