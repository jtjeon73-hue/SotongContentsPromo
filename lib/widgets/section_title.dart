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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 4,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: PromoTheme.accentGradient,
              ),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width < 600 ? 26 : 32,
                ),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: PromoTheme.textMuted,
              fontSize: 17,
            ),
          ),
        ],
      ],
    );
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.sectionKey,
  });

  final Widget child;
  final Color? backgroundColor;
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    final padding = PromoTheme.sectionPadding(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor ?? Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
