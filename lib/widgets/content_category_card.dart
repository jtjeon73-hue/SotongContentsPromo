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
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: category.accentColor.withValues(alpha: 0.15),
                ),
                child: Icon(
                  category.icon,
                  color: category.accentColor,
                  size: 24,
                ),
              ),
              const Spacer(),
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
          const SizedBox(height: 20),
          Text(category.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(
            category.description,
            style: Theme.of(context).textTheme.bodyMedium,
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
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  direction.accentColor.withValues(alpha: 0.3),
                  direction.accentColor.withValues(alpha: 0.1),
                ],
              ),
            ),
            child: Icon(direction.icon, color: direction.accentColor, size: 26),
          ),
          const SizedBox(height: 22),
          Text(direction.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(
            direction.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}
