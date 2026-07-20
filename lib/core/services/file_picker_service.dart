import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_picker_service.g.dart';

abstract class FilePickerService {
  Future<FilePickerResult?> pickFiles({bool allowMultiple = true});
}

class FilePickerServiceImpl implements FilePickerService {
  @override
  Future<FilePickerResult?> pickFiles({bool allowMultiple = true}) async {
    return FilePicker.pickFiles(allowMultiple: allowMultiple);
  }
}

@riverpod
FilePickerService filePickerService(Ref ref) {
  return FilePickerServiceImpl();
}
