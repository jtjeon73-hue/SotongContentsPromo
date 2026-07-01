import 'package:flutter/material.dart';

class ChannelPlan {
  const ChannelPlan({
    required this.title,
    required this.description,
    required this.purpose,
    required this.examples,
    required this.uploadDirection,
    required this.monetization,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final String description;
  final String purpose;
  final List<String> examples;
  final String uploadDirection;
  final String monetization;
  final IconData icon;
  final Color accentColor;
}

class ProductionStep {
  const ProductionStep({
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;
}

class MonetizationItem {
  const MonetizationItem({
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

class BusinessLink {
  const BusinessLink({
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

class FutureIdea {
  const FutureIdea({
    required this.title,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final IconData icon;
  final Color accentColor;
}
