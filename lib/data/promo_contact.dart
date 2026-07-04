class PromoContact {
  PromoContact._();

  static const String email = 'sotongware@naver.com';
  static const String subject = '[소통웨어 콘텐츠 문의]';
  static const String body = '''문의자 / 업체명 :

연락처 :

이메일 :

문의 분야 :

□ AI 음악 콘텐츠

□ YouTube / 숏폼 영상

□ 지역·시골 생활 영상

□ 앱 홍보 영상

□ 채널 기획 · 콘텐츠 기획

□ 협업 / 제작 문의

□ 기타

문의 내용 :''';

  static Uri mailtoUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: const {'subject': subject, 'body': body},
    );
  }

  static const String hubSubjectPrefix = '[소통총관제 접수]';
  static const String hubChannel = 'SotongContentsPromo';

  static Uri hubInquiryUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': '$hubSubjectPrefix 소통웨어 콘텐츠 상담 문의',
        'body':
            '''[소통총관제 연동 문의]
접수 채널: $hubChannel

문의자 / 업체명 :

연락처 :

문의 유형 : □ 콘텐츠 상담  □ AI 음악  □ YouTube·영상  □ 콘텐츠 기획  □ 기타

관심 분야 / 채널 :

문의 내용 :

---
※ 본 메일은 소통총관제 접수 흐름으로 처리됩니다.''',
      },
    );
  }

  static Uri hubCollaborationUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': '$hubSubjectPrefix 콘텐츠 협업 · 기획 제안',
        'body':
            '''[소통총관제 연동 — 협업/콘텐츠 기획]
접수 채널: $hubChannel

제안자 / 업체명 :

연락처 :

협업·기획 방향 (YouTube / AI 음악 / 채널 등) :

기대 일정 :

---
※ 소통총관제에서 검토 후 피드백·지시를 안내드립니다.''',
      },
    );
  }
}
