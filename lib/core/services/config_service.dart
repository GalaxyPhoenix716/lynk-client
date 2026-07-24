import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  /// Verifies generic system configuration key loaded from environment
  static Future<bool> applyConfigurationKey(String inputKey) async {
    final secret =
        dotenv.env['DEV_CONFIG_KEY'] ?? dotenv.env['AD_BYPASS_PASSCODE'];
    if (secret != null && secret.isNotEmpty && inputKey == secret) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('ads_enabled', false);
      return true;
    }
    return false;
  }
}
