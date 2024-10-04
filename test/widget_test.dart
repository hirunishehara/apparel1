import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apparel1/main.dart';

void main() {
  testWidgets('HomePage has expected widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Navigate to the home page if necessary
    await tester.tap(find.byTooltip('Home'));
    await tester.pumpAndSettle();

    // Verify that certain widgets are present on the home page
    expect(find.text('Welcome to UniqueU Apparel'), findsOneWidget); // Example text
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget); // Example icon
  });

  testWidgets('LoginPage has login button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Navigate to the login page if necessary
    await tester.tap(find.byTooltip('Login'));
    await tester.pumpAndSettle();

    // Verify that the login button is present
    expect(find.byType(ElevatedButton), findsOneWidget); // Assuming you have a button
  });
}
