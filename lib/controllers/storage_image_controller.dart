import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StorageImageController extends GetxController {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadFile(File file, XFile webFile, String path) async {
    try {
      Reference ref;
      if (foundation.kIsWeb) {
        ref = _firebaseStorage.ref().child(path).child(webFile.name);
        final UploadTask uploadTask = ref.putData(await webFile.readAsBytes());
        await uploadTask;
      } else {
        ref = _firebaseStorage
            .ref()
            .child(path)
            .child(file.uri.pathSegments.last);
        final UploadTask uploadTask = ref.putFile(file);
        await uploadTask;
      }
      final String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }
}
