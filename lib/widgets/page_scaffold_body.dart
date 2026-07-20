import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/footer_section.dart';

class PageScaffoldBody extends StatelessWidget {
  const PageScaffoldBody({
    super.key,
    required this.children,
    this.showFooter = true,
    this.controller,
  });

  final List<Widget> children;
  final bool showFooter;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          ...children.map((child) => SliverToBoxAdapter(child: child)),
          if (showFooter) const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}

class ComingSoonPanel extends StatelessWidget {
  const ComingSoonPanel({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: PromoTheme.pageBg,
      padding: EdgeInsets.symmetric(
        horizontal: PromoTheme.horizontalPadding(context),
        vertical: 72,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: PromoTheme.cardDecoration,
            child: Column(
              children: [
                Icon(icon, size: 42, color: PromoTheme.teal),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: PromoTheme.gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '준비 중',
                    style: TextStyle(
                      color: PromoTheme.gold,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
