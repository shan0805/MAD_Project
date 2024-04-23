// import 'dart:io';
// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:file_picker/file_picker.dart';

// class PlatformFilePicker {
//   static Future<String?> pickFile({bool isImage = false}) async {
//     if (!(ui.PlatformDispatcher.instance is PlatformDispatcherDesktop) &&
//         (Platform.isAndroid || Platform.isIOS)) {
//       try {
//         final result = await FilePicker.platform
//             .pickFiles(type: isImage ? FileType.image : FileType.any);
//         if (result != null && result.files.isNotEmpty) {
//           return result.files.single.path;
//         }
//       } on PlatformException catch (e) {
//         print('Error while picking file: $e');
//       }
//     } else {
//       // File picking is not supported on web and desktop platforms in this example.
//       // You can replace this with your custom file picking logic for web and desktop platforms.
//       print(
//           'File picking is not supported on web and desktop platforms in this example.');
//     }
//     return null;
//   }
// }
