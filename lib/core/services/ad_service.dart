import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdService {
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialLoading = false;

  /// Default Google Test Ad Unit IDs
  static const String _testBannerId = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitialId =
      'ca-app-pub-3940256099942544/1033173712';

  static String get bannerAdUnitId {
    if (kDebugMode) return _testBannerId;
    return dotenv.env['ADMOB_BANNER_ID'] ?? _testBannerId;
  }

  static String get interstitialAdUnitId {
    if (kDebugMode) return _testInterstitialId;
    return dotenv.env['ADMOB_INTERSTITIAL_ID'] ?? _testInterstitialId;
  }

  static Future<void> init() async {
    await MobileAds.instance.initialize();
  }

  static Future<bool> shouldShowAds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ads_enabled') ?? true;
  }

  static Future<void> preloadInterstitialAd() async {
    if (!await shouldShowAds() ||
        _isInterstitialLoading ||
        _interstitialAd != null) {
      return;
    }

    _isInterstitialLoading = true;
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialLoading = false;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
          _isInterstitialLoading = false;
        },
      ),
    );
  }

  static Future<void> showInterstitialAd() async {
    if (!await shouldShowAds()) return;

    if (_interstitialAd == null) {
      await preloadInterstitialAd();
    }

    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          preloadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _interstitialAd = null;
          preloadInterstitialAd();
        },
      );

      await _interstitialAd!.show();
    }
  }
}
