import 'package:client/features/file_transfer/presentation/helpers/qr_scan_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'QrScanHelper processBarcodeDetection extracts transferId from deep link URL',
    () {
      const rawUrl = 'https://lynk.app/send/test_transfer_123#myAesKey';
      final result = QrScanHelper.extractTransferIdAndKey(rawUrl);
      expect(result['transferId'], equals('test_transfer_123'));
      expect(result['aesKey'], equals('myAesKey'));
    },
  );

  test(
    'QrScanHelper processBarcodeDetection extracts transferId from custom scheme URL',
    () {
      const rawUrl = 'lynk://send/test_transfer_456#anotherKey';
      final result = QrScanHelper.extractTransferIdAndKey(rawUrl);
      expect(result['transferId'], equals('test_transfer_456'));
      expect(result['aesKey'], equals('anotherKey'));
    },
  );
}
