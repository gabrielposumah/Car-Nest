import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GFirebaseStorageService extends GetxController {
  static GFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // Upload local assets for IDE
  // Return a Uint8List containing image data
  Future<Uint8List> getImageDatafromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // Handle exceptions gracefully
      throw 'Error Loading image data : $e';
    }
  }

  // Upload image using imagedata on cloud Firebase stroage
  // Return the download URL of the uploaded data/image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      if(e is FirebaseException) {
        throw 'Firebase Exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if(e is PlatformException) {
        throw 'Platforms Exception : ${e.message}';
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    }
  }

  // Upload image on cloud Firebase Storage
  // Returns the download URL of the upload image.
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
       if(e is FirebaseException) {
        throw 'Firebase Exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if(e is PlatformException) {
        throw 'Platforms Exception : ${e.message}';
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    }
  }
}
