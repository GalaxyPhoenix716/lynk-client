import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdService {
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialLoading = false;
  static Completer<void>? _adLoadCompleter;

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
    if (kIsWeb) return;
    try {
      await MobileAds.instance.initialize();
      preloadInterstitialAd();
    } catch (e) {
      debugPrint('AdService initialization warning: $e');
    }
  }

  static Future<bool> shouldShowAds() async {
    if (kIsWeb) return false;
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ads_enabled') ?? true;
  }

  static Future<void> preloadInterstitialAd() async {
    if (kIsWeb || !await shouldShowAds() || _interstitialAd != null) {
      return;
    }
    if (_isInterstitialLoading) {
      return _adLoadCompleter?.future;
    }

    _isInterstitialLoading = true;
    _adLoadCompleter = Completer<void>();

    try {
      await InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
            _isInterstitialLoading = false;
            if (!(_adLoadCompleter?.isCompleted ?? true)) {
              _adLoadCompleter?.complete();
            }
          },
          onAdFailedToLoad: (error) {
            _interstitialAd = null;
            _isInterstitialLoading = false;
            if (!(_adLoadCompleter?.isCompleted ?? true)) {
              _adLoadCompleter?.complete();
            }
          },
        ),
      );
    } catch (e) {
      _isInterstitialLoading = false;
      if (!(_adLoadCompleter?.isCompleted ?? true)) {
        _adLoadCompleter?.complete();
      }
      debugPrint('AdService preload warning: $e');
    }

    return _adLoadCompleter?.future;
  }

  static Future<void> showInterstitialAd() async {
    if (kIsWeb || !await shouldShowAds()) return;

    if (_interstitialAd == null) {
      await preloadInterstitialAd();
    }

    if (_interstitialAd != null) {
      try {
        final adToShow = _interstitialAd!;
        _interstitialAd = null;

        adToShow.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            preloadInterstitialAd();
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
            preloadInterstitialAd();
          },
        );

        await adToShow.show();
      } catch (e) {
        debugPrint('AdService show warning: $e');
      }
    }
  }
}
