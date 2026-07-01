import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_contents_promo/app.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SotongContentsApp());
    await tester.pumpAndSettle();

    expect(find.text('소통웨어 콘텐츠'), findsWidgets);
    expect(find.text('콘텐츠 방향 보기'), findsOneWidget);
    expect(find.text('AI Music'), findsWidgets);
  });
}
