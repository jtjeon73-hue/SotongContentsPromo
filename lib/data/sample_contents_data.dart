import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/models/channel_plan.dart';
import 'package:sotong_contents_promo/models/content_category.dart';
import 'package:sotong_contents_promo/models/content_project.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

abstract final class SampleContentsData {
  static const String siteName = '소통웨어 콘텐츠';
  static const String siteNameEn = 'Sotong Contents Lab';
  static const String contactEmail = 'sotongware@naver.com';

  static const List<String> heroBadges = [
    'AI Music',
    'YouTube Contents',
    'Local Life Video',
    'Rural Life',
    'App Promo Video',
    'Shorts',
    'Storytelling',
    'Content Business',
  ];

  static const List<ContentDirection> contentDirections = [
    ContentDirection(
      title: 'AI 음악 콘텐츠',
      description: 'AI 음악을 활용해 감성적인 배경음악, 지역 홍보곡, 앱 홍보 음악, 테마별 음악 콘텐츠를 만듭니다.',
      icon: Icons.music_note_rounded,
      accentColor: PromoTheme.purple,
    ),
    ContentDirection(
      title: '지역 생활밀착 영상',
      description: '지역의 풍경, 사람, 생활, 행사, 농촌 일상, 마을 이야기를 영상 콘텐츠로 기록합니다.',
      icon: Icons.location_city_rounded,
      accentColor: PromoTheme.teal,
    ),
    ContentDirection(
      title: '시골 생활 콘텐츠',
      description: '농촌 생활, 계절 변화, 텃밭, 농산물, 마을 풍경을 음악과 결합해 콘텐츠로 만듭니다.',
      icon: Icons.eco_rounded,
      accentColor: PromoTheme.gold,
    ),
    ContentDirection(
      title: '앱 홍보 영상',
      description: '소통여행, 소통사주, 팜지기 등 개발한 앱의 기능과 가치를 쉽게 설명하는 홍보 영상을 제작합니다.',
      icon: Icons.smartphone_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    ContentDirection(
      title: '쇼츠 콘텐츠',
      description: '짧고 빠르게 소비되는 숏폼 콘텐츠로 앱, 지역, 음악, 생활정보를 알립니다.',
      icon: Icons.bolt_rounded,
      accentColor: PromoTheme.purpleDeep,
    ),
    ContentDirection(
      title: '수익형 콘텐츠 연결',
      description: '유튜브 광고, 앱 홍보, 전자책, 스마트스토어, 지역 상품과 연결되는 콘텐츠 구조를 만듭니다.',
      icon: Icons.hub_rounded,
      accentColor: PromoTheme.gold,
    ),
  ];

  static const List<ContentProject> portfolioProjects = [
    ContentProject(
      name: 'AI 음악 콘텐츠',
      category: 'AI 음악 / 배경음악 / 테마송',
      stage: '기획 및 제작 준비',
      description:
          'AI 음악을 활용해 앱 홍보 음악, 지역 홍보 음악, 감성 배경음악, 생활 영상용 음악을 제작하는 콘텐츠입니다.',
      components: [
        '앱 홍보 음악',
        '지역 홍보 음악',
        '감성 배경음악',
        '시골 풍경 음악',
        '유튜브 영상 BGM',
        '쇼츠용 짧은 음악',
      ],
      usageDirections: [
        '유튜브 영상',
        '앱 프로모',
        '지역 홍보',
        '전자책 소개 영상',
        '스마트스토어 상품 영상',
      ],
      status: ProjectStatus.preparing,
      statusLabel: '제작 준비',
      accentColor: PromoTheme.purple,
      icon: Icons.music_note_rounded,
    ),
    ContentProject(
      name: '지역 생활 영상',
      category: '지역 콘텐츠 / 생활 정보 / 마을 이야기',
      stage: '기획 단계',
      description: '지역의 생활정보, 풍경, 행사, 마을 이야기, 관광지, 생활 편의 정보를 영상으로 소개하는 콘텐츠입니다.',
      components: [
        '마을 풍경',
        '지역 행사',
        '관광지 소개',
        '생활정보',
        '지역 사람 이야기',
        '지역 상점/상품 소개',
      ],
      usageDirections: ['유튜브 채널', '지역 홍보', '앱 콘텐츠', '블로그/프로모 사이트 연계'],
      status: ProjectStatus.planning,
      statusLabel: '기획 중',
      accentColor: PromoTheme.teal,
      icon: Icons.videocam_rounded,
    ),
    ContentProject(
      name: '시골 생활 콘텐츠',
      category: '농촌 생활 / 자연 / 계절 콘텐츠',
      stage: '아이디어 정리',
      description: '농촌의 계절 변화, 텃밭, 농산물, 자연 풍경, 시골 일상을 음악과 영상으로 기록하는 콘텐츠입니다.',
      components: [
        '텃밭 이야기',
        '농산물 성장 과정',
        '계절 풍경',
        '마을 산책',
        '시골집 생활',
        '농촌 감성 영상',
      ],
      usageDirections: ['유튜브', '쇼츠', '전자책', '농산물 판매', '지역 생활 앱과 연계'],
      status: ProjectStatus.planning,
      statusLabel: '아이디어',
      accentColor: PromoTheme.gold,
      icon: Icons.nature_people_rounded,
    ),
    ContentProject(
      name: '앱 홍보 영상',
      category: '앱 프로모션 / 서비스 소개',
      stage: '소통여행 등 앱 개발과 연계 예정',
      description: '개발한 앱의 핵심 기능, 사용 방법, 장점, 수익모델을 영상으로 설명하는 홍보 콘텐츠입니다.',
      components: [
        '소통여행 소개 영상',
        '소통사주 소개 영상',
        '팜지기 소개 영상',
        '소통AI 소개 영상',
        '앱 사용법 영상',
        'APK 설치 안내 영상',
      ],
      usageDirections: ['앱 프로모 사이트', 'YouTube', '카카오톡 공유', 'Play Store 소개 자료'],
      status: ProjectStatus.inProgress,
      statusLabel: '연계 예정',
      accentColor: PromoTheme.tealMuted,
      icon: Icons.apps_rounded,
    ),
    ContentProject(
      name: '쇼츠 콘텐츠',
      category: '짧은 영상 / 빠른 홍보 / SNS 콘텐츠',
      stage: '콘텐츠 포맷 기획',
      description: '짧고 간결한 영상으로 앱, 지역 정보, 생활 팁, AI 음악, 전자책을 빠르게 알리는 콘텐츠입니다.',
      components: [
        '30초 앱 소개',
        '지역 풍경 쇼츠',
        '농촌 생활 쇼츠',
        'AI 음악 쇼츠',
        '생활 팁 쇼츠',
        '전자책 홍보 쇼츠',
      ],
      usageDirections: [
        'YouTube Shorts',
        'Instagram Reels',
        'TikTok',
        '카카오톡 공유',
      ],
      status: ProjectStatus.planning,
      statusLabel: '포맷 기획',
      accentColor: PromoTheme.purpleDeep,
      icon: Icons.flash_on_rounded,
    ),
    ContentProject(
      name: '브랜드 콘텐츠',
      category: '소통웨어 브랜드 / 사업 홍보',
      stage: '장기 확장 예정',
      description: '소통웨어의 산업자동화, 앱개발, 유튜브, 전자책 사업을 하나의 브랜드로 알리는 콘텐츠입니다.',
      components: [
        '소통웨어 소개 영상',
        '산업자동화 포트폴리오 영상',
        '앱개발 사업 소개 영상',
        '전자책 출간 소개 영상',
        '스마트스토어/소통창고 연결 영상',
      ],
      usageDirections: ['사업 홍보사이트', '고객 제안', '온라인 영업', '브랜드 신뢰 구축'],
      status: ProjectStatus.expanding,
      statusLabel: '장기 확장',
      accentColor: PromoTheme.goldLight,
      icon: Icons.business_center_rounded,
    ),
  ];

  static const List<ContentCategory> expandableCategories = [
    ContentCategory(
      title: 'AI 음악',
      description: '테마송, BGM, 앱 홍보 음악 등 음악 콘텐츠 영역',
      icon: Icons.piano_rounded,
      accentColor: PromoTheme.purple,
    ),
    ContentCategory(
      title: '지역 생활 영상',
      description: '마을, 관광, 생활정보 영상 콘텐츠 영역',
      icon: Icons.map_rounded,
      accentColor: PromoTheme.teal,
    ),
    ContentCategory(
      title: '시골 생활 콘텐츠',
      description: '농촌, 자연, 계절 콘텐츠 영역',
      icon: Icons.cottage_rounded,
      accentColor: PromoTheme.gold,
    ),
    ContentCategory(
      title: '앱 홍보 영상',
      description: '앱 기능 소개 및 프로모션 영상 영역',
      icon: Icons.phone_android_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    ContentCategory(
      title: '쇼츠 콘텐츠',
      description: '숏폼 SNS 콘텐츠 영역',
      icon: Icons.short_text_rounded,
      accentColor: PromoTheme.purpleDeep,
    ),
    ContentCategory(
      title: '브랜드 스토리',
      description: '소통웨어 브랜드 및 사업 소개 영역',
      icon: Icons.auto_stories_rounded,
      accentColor: PromoTheme.goldLight,
    ),
    ContentCategory(
      title: '전자책 홍보 영상',
      description: '전자책 출간 및 소개 영상 영역',
      icon: Icons.menu_book_rounded,
      accentColor: PromoTheme.purple,
    ),
    ContentCategory(
      title: '스마트스토어 상품 영상',
      description: '상품 소개 및 판매 연계 영상 영역',
      icon: Icons.storefront_rounded,
      accentColor: PromoTheme.teal,
    ),
  ];

  static const List<ProductionStep> productionSteps = [
    ProductionStep(
      step: 1,
      title: '콘텐츠 주제 선정',
      description: '앱, 지역, 생활정보, 농촌, 음악, 전자책 중 어떤 주제를 콘텐츠로 만들지 정합니다.',
    ),
    ProductionStep(
      step: 2,
      title: '스토리 구성',
      description: '영상의 흐름, 장면 구성, 핵심 메시지, 자막 구조를 정리합니다.',
    ),
    ProductionStep(
      step: 3,
      title: 'AI 음악 제작',
      description: '영상 분위기에 맞는 배경음악, 테마 음악, 짧은 쇼츠 음악을 제작합니다.',
    ),
    ProductionStep(
      step: 4,
      title: '영상 촬영 또는 자료 구성',
      description: '지역 영상, 생활 장면, 앱 화면 녹화, 이미지 자료 등을 준비합니다.',
    ),
    ProductionStep(
      step: 5,
      title: '편집 및 자막 구성',
      description: '음악, 영상, 자막, 전환 효과를 결합해 보기 좋은 콘텐츠로 정리합니다.',
    ),
    ProductionStep(
      step: 6,
      title: '업로드 및 홍보',
      description: 'YouTube, 쇼츠, 프로모 사이트, 카카오톡 공유, 블로그 등으로 콘텐츠를 배포합니다.',
    ),
    ProductionStep(
      step: 7,
      title: '수익화 연결',
      description: '앱 설치, 전자책 구매, 스마트스토어 상품, 제휴, 브랜드 홍보와 연결합니다.',
    ),
  ];

  static const List<ChannelPlan> channelPlans = [
    ChannelPlan(
      title: 'AI 음악 채널',
      description: '감성 음악, 테마송, 앱 홍보 음악, 지역 홍보 음악을 중심으로 운영합니다.',
      purpose: 'AI 음악 콘텐츠의 브랜드 허브 역할',
      examples: ['테마 BGM', '지역 홍보곡', '앱 프로모 음악', '쇼츠용 짧은 음악'],
      uploadDirection: '정기적인 음악 콘텐츠 업로드 및 플레이리스트 구성',
      monetization: '유튜브 광고, 음악 라이선스, 앱·지역 홍보 연계',
      icon: Icons.headphones_rounded,
      accentColor: PromoTheme.purple,
    ),
    ChannelPlan(
      title: '지역 생활 채널',
      description: '마을, 관광지, 생활정보, 지역 행사, 시골 생활 이야기를 소개합니다.',
      purpose: '지역 생활밀착 콘텐츠의 메인 채널',
      examples: ['마을 풍경', '지역 행사', '관광지 소개', '생활정보 영상'],
      uploadDirection: '지역별 시리즈 및 계절 콘텐츠 순차 업로드',
      monetization: '지역 협업, 관광 홍보, 스마트스토어 연계',
      icon: Icons.explore_rounded,
      accentColor: PromoTheme.teal,
    ),
    ChannelPlan(
      title: '앱 홍보 채널',
      description: '소통웨어 앱의 기능, 사용법, 개발 과정, APK 테스트 영상을 소개합니다.',
      purpose: '앱 설치 및 사용 전환을 위한 홍보 채널',
      examples: ['앱 소개', '기능 데모', '사용법 가이드', 'APK 설치 안내'],
      uploadDirection: '앱 업데이트 및 기능별 영상 순차 공개',
      monetization: '앱 설치 유도, 프리미엄 기능 홍보, 사업 제안 연계',
      icon: Icons.app_settings_alt_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    ChannelPlan(
      title: '사업 브랜드 채널',
      description: '산업자동화, 앱개발, 전자책, 스마트스토어를 연결하는 소통웨어 브랜드 콘텐츠를 운영합니다.',
      purpose: '소통웨어 전체 사업의 신뢰와 브랜드 인지도 구축',
      examples: ['사업 소개', '포트폴리오', '전자책 홍보', '스마트스토어 연계'],
      uploadDirection: '브랜드 스토리 및 사업 성과 중심 콘텐츠',
      monetization: 'B2B 제안, 브랜드 신뢰, 사업 확장 기회',
      icon: Icons.corporate_fare_rounded,
      accentColor: PromoTheme.gold,
    ),
  ];

  static const List<BusinessLink> businessLinks = [
    BusinessLink(
      title: '소통여행 앱 홍보 영상',
      description: '여행 일정, 지역 정보, 앱 기능을 연결하는 홍보 콘텐츠',
      icon: Icons.flight_takeoff_rounded,
      accentColor: PromoTheme.teal,
    ),
    BusinessLink(
      title: '소통사주 앱 소개 영상',
      description: '앱 기능과 사용 가치를 소개하는 프로모션 영상',
      icon: Icons.auto_awesome_rounded,
      accentColor: PromoTheme.purple,
    ),
    BusinessLink(
      title: '팜지기 농촌 콘텐츠',
      description: '농촌 생활과 앱을 연결하는 시골 콘텐츠',
      icon: Icons.agriculture_rounded,
      accentColor: PromoTheme.gold,
    ),
    BusinessLink(
      title: '소통AI 활용 영상',
      description: 'AI 기술과 콘텐츠 제작 과정을 소개하는 영상',
      icon: Icons.psychology_rounded,
      accentColor: PromoTheme.purpleDeep,
    ),
    BusinessLink(
      title: '산업자동화 포트폴리오 영상',
      description: '산업자동화 사업 역량을 보여주는 브랜드 영상',
      icon: Icons.precision_manufacturing_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    BusinessLink(
      title: '전자책 판매 홍보 영상',
      description: '전자책 출간과 판매를 연결하는 홍보 콘텐츠',
      icon: Icons.import_contacts_rounded,
      accentColor: PromoTheme.goldLight,
    ),
    BusinessLink(
      title: '소통창고/스마트스토어 상품 영상',
      description: '상품 소개와 구매 흐름을 연결하는 영상 콘텐츠',
      icon: Icons.shopping_bag_rounded,
      accentColor: PromoTheme.teal,
    ),
  ];

  static const List<MonetizationItem> monetizationItems = [
    MonetizationItem(
      title: '유튜브 광고 수익',
      description: '지속적인 영상 업로드와 시청자 확보를 통해 광고 수익을 목표로 합니다.',
      icon: Icons.play_circle_outline_rounded,
      accentColor: PromoTheme.teal,
    ),
    MonetizationItem(
      title: '앱 홍보 연결',
      description: '소통여행, 소통AI, 팜지기 등 앱 설치와 사용으로 연결합니다.',
      icon: Icons.install_mobile_rounded,
      accentColor: PromoTheme.purple,
    ),
    MonetizationItem(
      title: '전자책 판매 연결',
      description: '콘텐츠에서 다룬 경험과 지식을 전자책으로 정리해 판매로 연결합니다.',
      icon: Icons.book_rounded,
      accentColor: PromoTheme.gold,
    ),
    MonetizationItem(
      title: '스마트스토어 연결',
      description: '지역 상품, 농산물, 소통창고 상품을 콘텐츠와 연결해 판매 흐름을 만듭니다.',
      icon: Icons.store_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    MonetizationItem(
      title: '지역 홍보/협업',
      description: '지역 상점, 행사, 관광지, 농가와 협업 가능한 콘텐츠 구조를 만듭니다.',
      icon: Icons.handshake_rounded,
      accentColor: PromoTheme.purpleDeep,
    ),
    MonetizationItem(
      title: '브랜드 신뢰 구축',
      description: '꾸준한 콘텐츠로 소통웨어의 전문성과 신뢰를 쌓습니다.',
      icon: Icons.verified_rounded,
      accentColor: PromoTheme.goldLight,
    ),
  ];

  static const List<FutureIdea> futureIdeas = [
    FutureIdea(
      title: '소통여행 앱 소개 영상',
      icon: Icons.travel_explore_rounded,
      accentColor: PromoTheme.teal,
    ),
    FutureIdea(
      title: '제주도 여행 일정 영상',
      icon: Icons.beach_access_rounded,
      accentColor: PromoTheme.purple,
    ),
    FutureIdea(
      title: 'AI 음악으로 만든 지역 홍보곡',
      icon: Icons.library_music_rounded,
      accentColor: PromoTheme.gold,
    ),
    FutureIdea(
      title: '사매면 생활밀착 영상',
      icon: Icons.home_work_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
    FutureIdea(
      title: '시골집 하루 브이로그',
      icon: Icons.villa_rounded,
      accentColor: PromoTheme.purpleDeep,
    ),
    FutureIdea(
      title: '농산물 성장 기록',
      icon: Icons.grass_rounded,
      accentColor: PromoTheme.goldLight,
    ),
    FutureIdea(
      title: '앱 개발 과정 영상',
      icon: Icons.code_rounded,
      accentColor: PromoTheme.teal,
    ),
    FutureIdea(
      title: '산업자동화 모니터링 시스템 소개 영상',
      icon: Icons.monitor_heart_rounded,
      accentColor: PromoTheme.purple,
    ),
    FutureIdea(
      title: '전자책 출간 안내 영상',
      icon: Icons.auto_stories_rounded,
      accentColor: PromoTheme.gold,
    ),
    FutureIdea(
      title: '스마트스토어 상품 소개 영상',
      icon: Icons.local_mall_rounded,
      accentColor: PromoTheme.tealMuted,
    ),
  ];
}
