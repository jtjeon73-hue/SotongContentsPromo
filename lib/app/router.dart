import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotong_contents_promo/screens/about_page.dart';
import 'package:sotong_contents_promo/screens/coming_soon_page.dart';
import 'package:sotong_contents_promo/screens/contact_page.dart';
import 'package:sotong_contents_promo/screens/contents_page.dart';
import 'package:sotong_contents_promo/screens/filtered_contents_page.dart';
import 'package:sotong_contents_promo/screens/home_screen.dart';
import 'package:sotong_contents_promo/screens/news_page.dart';
import 'package:sotong_contents_promo/widgets/app_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            builder: (context, state) => const AboutPage(),
          ),
          GoRoute(
            path: '/contents',
            name: 'contents',
            builder: (context, state) => const ContentsPage(),
          ),
          GoRoute(
            path: '/video',
            name: 'video',
            builder: (context, state) => const FilteredContentsPage(
              title: '영상 콘텐츠',
              subtitle: '지역·시골·앱 홍보·브랜드 영상 프로젝트입니다.',
              projectNames: ['지역 생활 영상', '시골 생활 콘텐츠', '앱 홍보 영상', '브랜드 콘텐츠'],
            ),
          ),
          GoRoute(
            path: '/music',
            name: 'music',
            builder: (context, state) => const FilteredContentsPage(
              title: '음악·오디오',
              subtitle: 'AI 음악과 배경음악·테마송 콘텐츠입니다.',
              projectNames: ['AI 음악 콘텐츠'],
              directionTitles: ['AI 음악 콘텐츠'],
            ),
          ),
          GoRoute(
            path: '/image',
            name: 'image',
            builder: (context, state) => const ComingSoonPage(
              title: '이미지·디자인',
              description:
                  '썸네일, 커버, 채널 아트 등 이미지·디자인 콘텐츠 메뉴는 준비 중입니다. 기존 영상·음악 콘텐츠는 다른 메뉴에서 확인할 수 있습니다.',
              icon: Icons.image_rounded,
            ),
          ),
          GoRoute(
            path: '/ai',
            name: 'ai',
            builder: (context, state) => const FilteredContentsPage(
              title: 'AI 콘텐츠',
              subtitle: 'AI 음악과 AI를 활용하는 콘텐츠 제작 영역입니다.',
              projectNames: ['AI 음악 콘텐츠', '쇼츠 콘텐츠'],
              directionTitles: ['AI 음악 콘텐츠'],
            ),
          ),
          GoRoute(
            path: '/shorts',
            name: 'shorts',
            builder: (context, state) => const FilteredContentsPage(
              title: '쇼츠·SNS 콘텐츠',
              subtitle: '숏폼과 SNS 확산형 콘텐츠입니다.',
              projectNames: ['쇼츠 콘텐츠'],
              directionTitles: ['쇼츠 콘텐츠'],
            ),
          ),
          GoRoute(
            path: '/in-progress',
            name: 'in-progress',
            builder: (context, state) => const FilteredContentsPage(
              title: '제작 중인 콘텐츠',
              subtitle: '기획·제작 준비·연계 예정 단계의 콘텐츠입니다.',
              showAllProjects: true,
            ),
          ),
          GoRoute(
            path: '/news',
            name: 'news',
            builder: (context, state) => const NewsPage(),
          ),
          GoRoute(
            path: '/faq',
            name: 'faq',
            builder: (context, state) => const ComingSoonPage(
              title: '자주 묻는 질문',
              description: 'FAQ 페이지는 준비 중입니다. 콘텐츠 제작·협업 문의는 문의하기 메뉴를 이용해 주세요.',
              icon: Icons.help_outline_rounded,
            ),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            builder: (context, state) => const ContactPage(),
          ),
        ],
      ),
    ],
  );
}
