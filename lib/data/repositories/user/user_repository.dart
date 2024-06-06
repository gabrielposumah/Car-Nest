import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/features/authentication/models/users/user_model.dart';
import 'package:product_share_suzuki/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/firebase_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/format_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to firebase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
      print('User record saved successfully');
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on GPlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again Later';
    }
  }

  // Function to fetch user detail based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on GPlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again Later';
    }
  }

  // Function to update user data in firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on GPlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again Later';
    }
  }

  // update any field in spesific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on GPlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again Later';
    }
  }

  // Function to remove or delete user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on GPlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again Later';
    }
  }

  //Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
