import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/models/content_project.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class ContentProjectCard extends StatelessWidget {
  const ContentProjectCard({super.key, required this.project});

  final ContentProject project;

  Color _statusColor() {
    switch (project.status) {
      case ProjectStatus.planning:
        return PromoTheme.purple;
      case ProjectStatus.inProgress:
        return PromoTheme.teal;
      case ProjectStatus.preparing:
        return PromoTheme.gold;
      case ProjectStatus.expanding:
        return PromoTheme.goldLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();
    final isNarrow = MediaQuery.sizeOf(context).width < 600;

    return Container(
      width: double.infinity,
      decoration: PromoTheme.cardDecoration.copyWith(
        border: Border.all(color: project.accentColor.withValues(alpha: 0.2)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: project.accentColor.withValues(alpha: 0.15),
                ),
                child: Icon(project.icon, color: project.accentColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      project.category,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: PromoTheme.textMuted,
                        fontSize: 13,
                        height: 1.5,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              if (!isNarrow) ...[
                const SizedBox(width: 12),
                _StatusBadge(label: project.statusLabel, color: statusColor),
              ],
            ],
          ),
          if (isNarrow) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: _StatusBadge(
                label: project.statusLabel,
                color: statusColor,
              ),
            ),
          ],
          const SizedBox(height: 20),
          _InfoRow(label: '현재 단계', value: project.stage),
          const SizedBox(height: 14),
          Text(
            project.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.7),
            softWrap: true,
          ),
          const SizedBox(height: 20),
          _BulletSection(
            title: '주요 구성',
            items: project.components,
            color: project.accentColor,
          ),
          const SizedBox(height: 16),
          _BulletSection(
            title: '활용 방향',
            items: project.usageDirections,
            color: PromoTheme.teal,
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        softWrap: true,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: PromoTheme.gold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.6),
          softWrap: true,
        ),
      ],
    );
  }
}

class _BulletSection extends StatelessWidget {
  const _BulletSection({
    required this.title,
    required this.items,
    required this.color,
  });

  final String title;
  final List<String> items;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.6),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
