import 'package:flutter/material.dart';

class NavItem {
  const NavItem({
    required this.id,
    required this.label,
    required this.route,
    required this.icon,
  });

  final String id;
  final String label;
  final String route;
  final IconData icon;
}

abstract final class NavItems {
  static const home = NavItem(
    id: 'home',
    label: '홈',
    route: '/',
    icon: Icons.home_rounded,
  );
  static const about = NavItem(
    id: 'about',
    label: '소통콘텐츠 소개',
    route: '/about',
    icon: Icons.info_outline_rounded,
  );
  static const contents = NavItem(
    id: 'contents',
    label: '전체 콘텐츠',
    route: '/contents',
    icon: Icons.grid_view_rounded,
  );
  static const video = NavItem(
    id: 'video',
    label: '영상 콘텐츠',
    route: '/video',
    icon: Icons.videocam_rounded,
  );
  static const music = NavItem(
    id: 'music',
    label: '음악·오디오',
    route: '/music',
    icon: Icons.music_note_rounded,
  );
  static const image = NavItem(
    id: 'image',
    label: '이미지·디자인',
    route: '/image',
    icon: Icons.image_rounded,
  );
  static const ai = NavItem(
    id: 'ai',
    label: 'AI 콘텐츠',
    route: '/ai',
    icon: Icons.auto_awesome_rounded,
  );
  static const shorts = NavItem(
    id: 'shorts',
    label: '쇼츠·SNS 콘텐츠',
    route: '/shorts',
    icon: Icons.bolt_rounded,
  );
  static const inProgress = NavItem(
    id: 'in-progress',
    label: '제작 중인 콘텐츠',
    route: '/in-progress',
    icon: Icons.construction_rounded,
  );
  static const news = NavItem(
    id: 'news',
    label: '새 소식',
    route: '/news',
    icon: Icons.campaign_rounded,
  );
  static const faq = NavItem(
    id: 'faq',
    label: '자주 묻는 질문',
    route: '/faq',
    icon: Icons.help_outline_rounded,
  );
  static const contact = NavItem(
    id: 'contact',
    label: '문의하기',
    route: '/contact',
    icon: Icons.mail_outline_rounded,
  );

  static const List<NavItem> all = [
    home,
    about,
    contents,
    video,
    music,
    image,
    ai,
    shorts,
    inProgress,
    news,
    faq,
    contact,
  ];

  static NavItem? byRoute(String location) {
    final path = Uri.parse(location).path;
    for (final item in all) {
      if (item.route == path) return item;
    }
    return null;
  }

  static String titleFor(String location) {
    return byRoute(location)?.label ?? '소통콘텐츠';
  }
}
