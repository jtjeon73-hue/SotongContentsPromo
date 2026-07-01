import 'package:flutter/material.dart';

abstract final class PromoTheme {
  static const Color deepNavy = Color(0xFF0A0E1A);
  static const Color richBlack = Color(0xFF050508);
  static const Color surfaceDark = Color(0xFF12182B);
  static const Color surfaceCard = Color(0xFF1A2238);
  static const Color surfaceElevated = Color(0xFF1E2640);
  static const Color teal = Color(0xFF2DD4BF);
  static const Color tealMuted = Color(0xFF14B8A6);
  static const Color purple = Color(0xFF8B5CF6);
  static const Color purpleDeep = Color(0xFF6D28D9);
  static const Color gold = Color(0xFFD4A853);
  static const Color goldLight = Color(0xFFE8C97A);
  static const Color offWhite = Color(0xFFF8FAFC);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color borderSubtle = Color(0xFF2A3548);

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      primary: teal,
      secondary: purple,
      tertiary: gold,
      surface: surfaceDark,
      onPrimary: richBlack,
      onSecondary: offWhite,
      onSurface: offWhite,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: deepNavy,
      fontFamily: 'Noto Sans KR',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: offWhite,
          height: 1.2,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: offWhite,
          height: 1.25,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: offWhite,
          height: 1.3,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: offWhite,
          height: 1.35,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: offWhite,
          height: 1.4,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: offWhite,
          height: 1.45,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.7,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.65,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: offWhite,
          letterSpacing: 0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: teal,
          foregroundColor: richBlack,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'Noto Sans KR',
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: offWhite,
          side: const BorderSide(color: Color(0xFF334155), width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'Noto Sans KR',
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF1E293B),
        labelStyle: const TextStyle(
          color: textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        side: const BorderSide(color: Color(0xFF334155)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF1E293B),
        thickness: 1,
      ),
    );
  }

  static BoxDecoration get cardDecoration => BoxDecoration(
    color: surfaceCard,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: borderSubtle.withValues(alpha: 0.9)),
    boxShadow: [
      BoxShadow(
        color: richBlack.withValues(alpha: 0.35),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static BoxDecoration get heroGradient => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [deepNavy, surfaceDark, Color(0xFF0F1729)],
    ),
  );

  static BoxDecoration get sectionDecoration =>
      const BoxDecoration(color: deepNavy);

  static BoxDecoration get alternateSectionDecoration =>
      const BoxDecoration(color: surfaceDark);

  static LinearGradient get accentGradient =>
      const LinearGradient(colors: [teal, purple]);

  static LinearGradient get goldGradient =>
      const LinearGradient(colors: [gold, goldLight]);

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 20;
    if (width < 900) return 40;
    return 48;
  }

  static double verticalSectionPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 56 : 80;
  }
}
