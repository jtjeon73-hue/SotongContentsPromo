import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/screens/home_screen.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class SotongContentsApp extends StatelessWidget {
  const SotongContentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '소통웨어 콘텐츠',
      debugShowCheckedModeBanner: false,
      theme: PromoTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
