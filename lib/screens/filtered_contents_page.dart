import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/data/sample_contents_data.dart';
import 'package:sotong_contents_promo/models/content_project.dart';
import 'package:sotong_contents_promo/widgets/content_category_card.dart';
import 'package:sotong_contents_promo/widgets/content_project_card.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/responsive_card_grid.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class FilteredContentsPage extends StatelessWidget {
  const FilteredContentsPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.projectNames = const [],
    this.directionTitles = const [],
    this.showAllProjects = false,
  });

  final String title;
  final String subtitle;
  final List<String> projectNames;
  final List<String> directionTitles;
  final bool showAllProjects;

  @override
  Widget build(BuildContext context) {
    final projects = showAllProjects
        ? SampleContentsData.portfolioProjects
        : SampleContentsData.portfolioProjects
              .where((p) => projectNames.contains(p.name))
              .toList();
    final directions = SampleContentsData.contentDirections
        .where((d) => directionTitles.contains(d.title))
        .toList();

    return PageScaffoldBody(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: title, subtitle: subtitle),
              if (directions.isNotEmpty) ...[
                const SizedBox(height: 40),
                ResponsiveCardGrid(
                  itemCount: directions.length,
                  minCardWidth: 320,
                  itemBuilder: (context, index) =>
                      ContentDirectionCard(direction: directions[index]),
                ),
              ],
              if (projects.isNotEmpty) ...[
                const SizedBox(height: 40),
                ...projects.map(
                  (ContentProject project) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ContentProjectCard(project: project),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
