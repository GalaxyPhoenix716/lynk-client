import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  /// Requests Camera, Media/Photos/Videos, Storage, and Notifications permissions.
  static Future<bool> requestAllPermissions() async {
    if (kIsWeb) return true;

    try {
      final statuses = await [
        Permission.camera,
        Permission.notification,
        if (Platform.isAndroid) ...[
          Permission.storage,
          Permission.photos,
          Permission.videos,
        ],
      ].request();

      return statuses.values.every(
        (status) => status.isGranted || status.isLimited,
      );
    } catch (e) {
      debugPrint('Permission request error: $e');
      return false;
    }
  }

  /// Checks if camera permission is granted.
  static Future<bool> hasCameraPermission() async {
    if (kIsWeb) return true;
    final status = await Permission.camera.status;
    return status.isGranted || status.isLimited;
  }
}
