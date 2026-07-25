import 'package:client/core/services/ad_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdService contract supports Rewarded and RewardedInterstitial Ads', () {
    expect(AdService.loadRewardedAd, isA<Function>());
    expect(AdService.showRewardedAd, isA<Function>());
    expect(AdService.loadRewardedInterstitialAd, isA<Function>());
    expect(AdService.showRewardedInterstitialAd, isA<Function>());
  });
}
