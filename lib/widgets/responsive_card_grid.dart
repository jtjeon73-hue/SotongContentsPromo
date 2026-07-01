import 'package:flutter/material.dart';

/// minCardWidth 기준으로 열 수를 계산하고, 1열은 [Column], 2열 이상은 [Wrap]으로
/// 카드 높이가 콘텐츠에 맞게 늘어나도록 구성합니다.
class ResponsiveCardGrid extends StatelessWidget {
  const ResponsiveCardGrid({
    super.key,
    required this.itemCount,
    required this.minCardWidth,
    required this.itemBuilder,
    this.maxColumns = 3,
    this.spacing = 20,
  });

  final int itemCount;
  final double minCardWidth;
  final int maxColumns;
  final double spacing;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = (constraints.maxWidth / minCardWidth)
            .floor()
            .clamp(1, maxColumns);

        if (crossAxisCount == 1) {
          return Column(
            children: List.generate(
              itemCount,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index < itemCount - 1 ? spacing : 0,
                ),
                child: itemBuilder(context, index),
              ),
            ),
          );
        }

        final cardWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(
            itemCount,
            (index) =>
                SizedBox(width: cardWidth, child: itemBuilder(context, index)),
          ),
        );
      },
    );
  }
}
