import 'package:flutter/material.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';

/// 소통총관제 연동 흐름 — 콘텐츠 프로모 사이트 (실제 API 미연동)
class SotongHubConfig {
  SotongHubConfig._();

  static const String hubName = '소통총관제';
  static const String hubSubtitle = 'Sotong Central Command Hub';
  static const String siteLabel = 'SotongContentsPromo';

  static const flowSteps = [
    HubFlowStep(
      step: 1,
      title: '온라인 문의 접수',
      description: '콘텐츠 상담·협업·AI 음악·YouTube·채널 기획 문의가 홍보사이트와 이메일로 접수됩니다.',
      icon: Icons.edit_note_outlined,
      color: PromoTheme.teal,
    ),
    HubFlowStep(
      step: 2,
      title: '소통총관제 배정',
      description: '총관제에서 콘텐츠 유형·채널 단계·제작 범위별로 담당 채널에 배정합니다.',
      icon: Icons.hub_outlined,
      color: PromoTheme.gold,
    ),
    HubFlowStep(
      step: 3,
      title: '피드백 · 상담 회신',
      description: '검토 결과, 제작 가능 범위, 일정·콘텐츠 기획 제안에 대한 피드백을 전달합니다.',
      icon: Icons.forum_outlined,
      color: PromoTheme.purple,
    ),
    HubFlowStep(
      step: 4,
      title: '총관제 지시 반영',
      description: '후속 미팅, 영상 제작, 채널 업로드, Promo 사이트 수정 등 총관제 지시에 따라 진행합니다.',
      icon: Icons.assignment_turned_in_outlined,
      color: PromoTheme.goldLight,
    ),
  ];

  static const sampleTickets = [
    HubTicket(
      id: 'CNT-2407-001',
      type: '콘텐츠 상담',
      status: HubTicketStatus.received,
      summary: 'AI 음악 기반 YouTube 배경음악·테마송 제작 검토',
    ),
    HubTicket(
      id: 'CNT-2407-002',
      type: '채널 기획',
      status: HubTicketStatus.inReview,
      summary: '지역 생활·시골 풍경 YouTube 채널 공동 기획 문의',
    ),
    HubTicket(
      id: 'CNT-2407-003',
      type: '영상 제작',
      status: HubTicketStatus.feedback,
      summary: '앱 홍보 영상·쇼츠 콘텐츠 제작 범위 및 일정',
    ),
    HubTicket(
      id: 'CNT-2407-004',
      type: 'Promo 연동',
      status: HubTicketStatus.instruction,
      summary: '콘텐츠 포트폴리오 홍보사이트 업데이트 지시',
    ),
  ];

  static const sampleInstructions = [
    HubInstruction(
      title: '콘텐츠 기획안 보완',
      description: '채널 컨셉·타깃 시청자·업로드 주기 개요 전달',
    ),
    HubInstruction(
      title: '상담 일정 확정',
      description: '온라인 미팅 7/18 14:00 — AI 음악·영상 제작 범위 논의',
    ),
    HubInstruction(
      title: '제작 단계 지시',
      description: '1차 영상 시안 완료 후 Promo 사이트 썸네일 반영',
    ),
  ];
}

class HubFlowStep {
  const HubFlowStep({
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final int step;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
}

enum HubTicketStatus {
  received('접수', PromoTheme.teal),
  inReview('검토중', PromoTheme.gold),
  feedback('피드백', PromoTheme.purple),
  instruction('지시반영', PromoTheme.goldLight);

  const HubTicketStatus(this.label, this.color);
  final String label;
  final Color color;
}

class HubTicket {
  const HubTicket({
    required this.id,
    required this.type,
    required this.status,
    required this.summary,
  });

  final String id;
  final String type;
  final HubTicketStatus status;
  final String summary;
}

class HubInstruction {
  const HubInstruction({required this.title, required this.description});

  final String title;
  final String description;
}
