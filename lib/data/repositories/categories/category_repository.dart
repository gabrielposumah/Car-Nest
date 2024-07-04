import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/services/firebase_storage_service.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';
import 'package:product_share_suzuki/utils/exceptions/firebase_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/platform_exceptions.dart';


class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

   Future<void> addCategory(CategoryModel category, File imageFile) async {
    try {
      // Upload image and get download URL
      final imageUrl = await uploadImage(imageFile, category.name);

      // Create new document in 'categories' collection
      await _db.collection('Categories').add({
        'Name': category.name,
        'Image': imageUrl,
        'ParentId': category.parentId,
        'IsFeatured': category.isFeatured,
      });
    } catch (e) {
      throw 'Failed to add category: $e';
    }
  }

   Future<void> createCategory(CategoryModel category) async {
    // Create a new document in Firebase Firestore with an auto-generated ID
    final docRef = _db.collection('Categories').doc();
    category.id = docRef.id;
    await docRef.set(category.toJson());
  }

  // Get sub categories

  // Upload categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {

      // Upload all the categories along with their Images
      final storage = Get.put(GFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDatafromAssets(category.image);

        // Upload image and Get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign Url to category.image attribute
        category.image = url;

        // Storage Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }

    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImage(File imageFile, String imageName) async {
    try {
      final ref =FirebaseStorage.instance.ref().child('Categories/Images/Categories/${imageName}');
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
  

  // Future<String> uploadImage(XFile image) async {
  //   try {
  //    final ref =FirebaseStorage.instance.ref().child('Categories/Images/Categories/${image.name}');
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } on FirebaseAuthException catch (e) {
  //     throw GFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw GFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const GFormatException();
  //   } on PlatformException catch (e) {
  //     throw GPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong';
  //   }
  // }

  Future<void> updateCategoryImage(Map<String, dynamic> json) async {
    await _db.collection('categories').doc('category_id').update(json);
  }
}