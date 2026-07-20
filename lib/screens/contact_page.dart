import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/widgets/contact_section.dart';
import 'package:sotong_contents_promo/widgets/page_scaffold_body.dart';
import 'package:sotong_contents_promo/widgets/section_title.dart';
import 'package:sotong_contents_promo/widgets/sotong_control_hub_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffoldBody(
      children: [
        SotongControlHubSection(),
        SectionContainer(child: ContactSection()),
      ],
    );
  }
}
