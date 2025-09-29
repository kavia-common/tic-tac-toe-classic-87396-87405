import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_frontend/main.dart';

void main() {
  testWidgets('Header title exists and reset button present', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    // App bar title
    expect(find.text('Tic Tac Toe'), findsOneWidget);
    // Reset button in footer
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets('Board has 9 cells', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    // There are 9 tappable cells (InkWell)
    final cells = find.byType(InkWell);
    expect(cells, findsWidgets);
  });
}
