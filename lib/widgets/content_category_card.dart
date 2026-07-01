import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/models/content_category.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class ContentCategoryCard extends StatelessWidget {
  const ContentCategoryCard({
    super.key,
    required this.category,
    this.showExpandHint = true,
  });

  final ContentCategory category;
  final bool showExpandHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 10,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: category.accentColor.withValues(alpha: 0.15),
                ),
                child: Icon(
                  category.icon,
                  color: category.accentColor,
                  size: 24,
                ),
              ),
              if (showExpandHint && category.isExpandable)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: PromoTheme.teal.withValues(alpha: 0.12),
                    border: Border.all(
                      color: PromoTheme.teal.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Text(
                    '+ 확장',
                    style: TextStyle(
                      color: PromoTheme.teal,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
            softWrap: true,
          ),
          const SizedBox(height: 10),
          Text(
            category.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.65),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class ContentDirectionCard extends StatelessWidget {
  const ContentDirectionCard({super.key, required this.direction});

  final ContentDirection direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  direction.accentColor.withValues(alpha: 0.3),
                  direction.accentColor.withValues(alpha: 0.1),
                ],
              ),
            ),
            child: Icon(direction.icon, color: direction.accentColor, size: 24),
          ),
          const SizedBox(height: 18),
          Text(
            direction.title,
            style: Theme.of(context).textTheme.titleLarge,
            softWrap: true,
          ),
          const SizedBox(height: 10),
          Text(
            direction.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.7),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
