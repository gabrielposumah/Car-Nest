import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/product/models/banner_model.dart';
import 'package:product_share_suzuki/utils/exceptions/firebase_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  // Upload banners to the cloud firebase

  // add banners to firebase firestore
   Future<void> addBanner(BannerModel banner, File imageFile) async {
  try {
    // Upload image and get download URL
    final imageUrl = await uploadImage(imageFile, banner.imageUrl);

    // Create new document in 'banners' collection
    await _db.collection('Banners').add({
      'ImageUrl': imageUrl,
      'TargetScreen': banner.targetScreen,
      'Active': banner.active,
    });
  } catch (e) {
    throw 'Failed to add banner: $e';
  }
}

  Future<String> uploadImage(File imageFile, String imageName) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('/Images/Banners/$imageName');
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

 Future<List<BannerModel>> getActiveBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('ctive', isEqualTo: true).get();
      final banners = snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      return banners;
    } catch (e) {
      throw 'Error getting active banners: $e';
    }
  }
}
