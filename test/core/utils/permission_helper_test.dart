import 'package:client/core/utils/permission_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PermissionHelper hasCameraPermission contract exists', () async {
    expect(PermissionHelper.hasCameraPermission, isA<Function>());
    expect(PermissionHelper.requestAllPermissions, isA<Function>());
  });
}
