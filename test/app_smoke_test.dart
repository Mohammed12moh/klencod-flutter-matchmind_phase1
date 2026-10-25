import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matchmind/main.dart';

void main() {
  testWidgets('يبدأ التطبيق ويعرض شاشة الرئيسية مع التبويبات الخمسة',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MatchMindApp());
    await tester.pumpAndSettle();

    // عنوان الشاشة الرئيسية
    expect(find.text('MatchMind'), findsOneWidget);

    // التبويبات السفلية الخمسة
    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('المباريات'), findsOneWidget);
    expect(find.text('التحليل'), findsOneWidget);
    expect(find.text('المجتمع'), findsOneWidget);
    expect(find.text('حسابي'), findsOneWidget);
  });

  testWidgets('الانتقال إلى تبويب المباريات يعمل بدون أخطاء',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MatchMindApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('المباريات'));
    await tester.pumpAndSettle();

    expect(find.text('مباشر'), findsOneWidget);
  });
}
