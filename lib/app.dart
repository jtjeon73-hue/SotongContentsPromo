import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/app/router.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

class SotongContentsApp extends StatelessWidget {
  const SotongContentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '소통웨어 콘텐츠',
      debugShowCheckedModeBanner: false,
      theme: PromoTheme.lightTheme,
      routerConfig: createAppRouter(),
    );
  }
}
