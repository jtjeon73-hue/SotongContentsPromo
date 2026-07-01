import 'package:flutter/material.dart';

class ContentCategory {
  const ContentCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    this.isExpandable = true,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final bool isExpandable;
}

class ContentDirection {
  const ContentDirection({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
}
