import 'package:client/core/services/ad_service.dart';
import 'package:client/features/file_transfer/presentation/providers/upload_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Dual Transfer Mode & Ad Monetization Mapping', () {
    test('UploadState supports TransferMode p2p and cloud', () {
      const defaultState = UploadState();
      expect(defaultState.transferMode, equals(TransferMode.cloud));

      final p2pState = defaultState.copyWith(transferMode: TransferMode.p2p);
      expect(p2pState.transferMode, equals(TransferMode.p2p));
    });

    test(
      'R2 Cloud Session mode uses Rewarded Interstitial Ad contract',
      () async {
        bool rewardGranted = false;
        final result = await AdService.showRewardedInterstitialAd(
          onRewardGranted: () => rewardGranted = true,
        );

        expect(result, isNotNull);
        expect(rewardGranted, isTrue);
      },
    );

    test('Instant Direct P2P mode uses Rewarded Video Ad contract', () async {
      bool rewardGranted = false;
      final result = await AdService.showRewardedAd(
        onRewardGranted: () => rewardGranted = true,
      );

      expect(result, isNotNull);
      expect(rewardGranted, isTrue);
    });
  });
}
