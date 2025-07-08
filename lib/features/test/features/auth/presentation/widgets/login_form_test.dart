import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wellness_app/features/auth/presentation/widgets/login_form.dart';

void main() {
  testWidgets('Shows validation errors on empty submit', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(body: LoginForm()),
        routes: {
          '/dashboard': (context) => const Scaffold(body: Text('Dashboard')),
        },
      ),
    );

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Email Address is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });

  testWidgets('Accepts valid email and password', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: LoginForm(
            loginDelay: Duration.zero,
          ),
        ),
        routes: {
          '/dashboard': (context) => const Scaffold(body: Text('Dashboard')),
        },
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
