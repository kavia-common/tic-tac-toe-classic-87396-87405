import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_frontend/main.dart';

void main() {
  testWidgets('App bar shows Tic Tac Toe title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Build frame to allow AppBar to render
    await tester.pumpAndSettle();

    expect(find.text('Tic Tac Toe'), findsOneWidget);
  });

  testWidgets('Board renders 9 tappable cells', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // The grid should have 9 cells
    expect(find.byType(InkWell), findsNWidgets(9));
  });

  testWidgets('Tap places an X then an O', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Tap first cell -> X
    final firstCell = find.byType(InkWell).first;
    await tester.tap(firstCell);
    await tester.pump();

    expect(find.text('X'), findsOneWidget);

    // Tap second cell -> O
    final secondCell = find.byType(InkWell).at(1);
    await tester.tap(secondCell);
    await tester.pump();

    expect(find.text('O'), findsOneWidget);
  });

  testWidgets('Reset button clears the board', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Make a couple moves
    await tester.tap(find.byType(InkWell).at(0));
    await tester.pump();
    await tester.tap(find.byType(InkWell).at(1));
    await tester.pump();

    expect(find.text('X'), findsOneWidget);
    expect(find.text('O'), findsOneWidget);

    // Reset
    await tester.tap(find.text('Reset Game'));
    await tester.pump();

    // Should be cleared
    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);
  });
}
