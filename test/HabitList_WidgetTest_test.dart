// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intent/Main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Habits list displays habits', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    /* await tester.pumpWidget(IntentApp());

    // Expect that our habit list is created
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsWidgets);
    expect(find.widgetWithText(Card, "Habit Title"), findsWidgets);

    await tester.pump();

    await tester.drag(find.byType(ListView), Offset(0, -200));

    await tester.pump();

    expect(find.widgetWithText(Card, "Habit Title"), findsNWidgets(15)); */
  });
}
