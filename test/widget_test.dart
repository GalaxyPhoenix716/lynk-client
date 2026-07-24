import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/main.dart';
import 'package:client/features/home/presentation/pages/home_screen.dart';
import 'package:client/features/onboarding/presentation/providers/onboarding_provider.dart';

void main() {
  testWidgets('Smoke test for GoRouter navigation rendering HomeScreen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingProvider.overrideWith(() => MockOnboardingNotifier()),
        ],
        child: const LynkApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Send Files'), findsOneWidget);
    expect(find.text('Scan QR Code'), findsOneWidget);
    expect(find.text('Receive Files'), findsOneWidget);
  });
}

class MockOnboardingNotifier extends OnboardingNotifier {
  @override
  bool build() => true;
}
