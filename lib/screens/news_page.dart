import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/widgets/monetization_section.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffoldBody(
      children: [SectionContainer(child: FutureIdeasSection())],
    );
  }
}
