import 'package:flutter_test/flutter_test.dart';
import 'package:client/core/utils/file_size_formatter.dart';

void main() {
  group('FileSizeFormatter', () {
    test('formats 0 bytes correctly', () {
      expect(FileSizeFormatter.format(0), '0 B');
    });

    test('formats bytes correctly', () {
      expect(FileSizeFormatter.format(500), '500 B');
    });

    test('formats kilobytes correctly', () {
      expect(FileSizeFormatter.format(1024), '1.00 KB');
      expect(FileSizeFormatter.format(1536), '1.50 KB');
    });

    test('formats megabytes correctly', () {
      expect(FileSizeFormatter.format(1048576), '1.00 MB');
      expect(FileSizeFormatter.format(52428800), '50.00 MB');
    });

    test('formats gigabytes correctly', () {
      expect(FileSizeFormatter.format(1073741824), '1.00 GB');
    });
  });
}
