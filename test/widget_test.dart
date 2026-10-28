import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yaron_portfolio_flutter/main.dart';

void main() {
  testWidgets('Portfolio app opens', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

