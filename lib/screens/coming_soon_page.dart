import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({
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
    return PageScaffoldBody(
      children: [
        ComingSoonPanel(title: title, description: description, icon: icon),
      ],
    );
  }
}
