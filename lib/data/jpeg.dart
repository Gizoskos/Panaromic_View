import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class JpgFilesProvider extends ChangeNotifier {
  final List<File> _jpeg = [];

  List<File> get jpeg => _jpeg;

  Future<void> fetchImageFiles(BuildContext context) async {
    List<String> jpg = [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
      "assets/images/3a.jpg",
      "assets/images/4.jpg",
      "assets/images/5.jpg",
      "assets/images/6.jpg",
      "assets/images/8.jpg",
    ];

    for (String assetPath in jpg) {
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();
      String tempPath = (await getTemporaryDirectory()).path;
      String fileName = assetPath.split('/').last;
      File copiedFile = File('$tempPath/$fileName');
      await copiedFile.writeAsBytes(bytes);
      _jpeg.add(copiedFile);
    }
    notifyListeners();
  }
}
