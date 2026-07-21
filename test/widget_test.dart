import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/main.dart';
import 'package:client/core/routing/app_router.dart';
import 'package:client/features/onboarding/presentation/providers/onboarding_provider.dart';

void main() {
  testWidgets('Smoke test for GoRouter navigation rendering', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingProvider.overrideWith(() => MockOnboardingNotifier()),
        ],
        child: const LynkApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(PlaceholderScreen), findsOneWidget);
  });
}

class MockOnboardingNotifier extends OnboardingNotifier {
  @override
  bool build() => true;
}
