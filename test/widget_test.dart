import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_contents_promo/app.dart';

void main() {
  testWidgets('App loads home screen with shell navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SotongContentsApp());
    await tester.pumpAndSettle();

    expect(find.text('소통웨어 콘텐츠'), findsWidgets);
    expect(find.text('콘텐츠 방향 보기'), findsOneWidget);
    expect(find.text('AI Music'), findsWidgets);
    expect(find.text('홈'), findsWidgets);
    expect(find.text('문의하기'), findsWidgets);
  });
}
