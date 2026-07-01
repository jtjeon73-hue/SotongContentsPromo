import 'package:flutter/material.dart';

enum ProjectStatus { planning, inProgress, preparing, expanding }

class ContentProject {
  const ContentProject({
    required this.name,
    required this.category,
    required this.stage,
    required this.description,
    required this.components,
    required this.usageDirections,
    required this.status,
    required this.statusLabel,
    required this.accentColor,
    required this.icon,
  });

  final String name;
  final String category;
  final String stage;
  final String description;
  final List<String> components;
  final List<String> usageDirections;
  final ProjectStatus status;
  final String statusLabel;
  final Color accentColor;
  final IconData icon;
}
