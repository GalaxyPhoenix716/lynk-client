import 'package:client/core/routing/app_router.dart';
import 'package:client/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeOnboardingNotifier extends OnboardingNotifier {
  @override
  bool build() => true;
}

void main() {
  test(
    'AppRouter matches /send/:transferId deep link and parses transferId & fragment aesKey',
    () {
      final container = ProviderContainer(
        overrides: [
          onboardingProvider.overrideWith(() => FakeOnboardingNotifier()),
        ],
      );
      addTearDown(container.dispose);

      final router = container.read(appRouterProvider);
      final uri = Uri.parse(
        '/send/tx_test_12345#mySecretAesKey32CharsLongDataKey!!',
      );
      final matchList = router.configuration.findMatch(uri);

      expect(matchList.matches.isNotEmpty, isTrue);
      expect(matchList.matches.last.matchedLocation, '/send/tx_test_12345');
      expect(uri.pathSegments.last, 'tx_test_12345');
      expect(uri.fragment, 'mySecretAesKey32CharsLongDataKey!!');
    },
  );
}
