import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/main.dart';

void main() {
  testWidgets('Smoke test for HomeScreen rendering', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: LynkApp(),
      ),
    );

    // Verify that the HomeScreen displays the main title
    expect(find.text('Lynk File Transfer'), findsOneWidget);
    expect(find.text('Select option to send or receive files'), findsOneWidget);
  });
}
