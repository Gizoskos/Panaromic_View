import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class JpgFilesProvider extends ChangeNotifier {
  List<File> _jpeg = [];

  List<File> get jpeg => _jpeg;

  Future<void> fetchImageFiles(BuildContext context) async {
    Directory directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = directory.listSync();
    _jpeg = files
        .whereType<File>()
        .where((file) => file.path.endsWith('.jpg'))
        .toList();
    notifyListeners();
  }
}
