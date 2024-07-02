import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/services/firebase_storage_service.dart';
import 'package:product_share_suzuki/utils/enums/enums.dart';
import 'package:product_share_suzuki/utils/exceptions/firebase_exceptions.dart';
import 'package:product_share_suzuki/utils/exceptions/platform_exceptions.dart';

import '../../../features/product/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
   Future<List<ProductModel>> getFeaturedProducts() async { 
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again later';
    }
   }

  // Upload dummy data to the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async{
    try {
      // upload all the products along with their images
      final storage = Get.put(GFirebaseStorageService());

      // Loop through each product
      for(var product in products){
        // Get image data link from local assets
        final thumbnail = await storage.getImageDatafromAssets(product.thumbnail);

        // upload image and get its URL
         final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail
        product.thumbnail = url;

        // Product list of images
        if(product.images !=null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for(var image in product.images!) {
            // Get images data link from local assets
            final assetImage = await storage.getImageDatafromAssets(image);

            // upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attributes
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        
        // Upload variation Images
        if(product.productType == ProductType.variable.toString()){
          for(var variation in product.productVariations!){
            // get image data link from local assets
            final assetImage = await storage.getImageDatafromAssets(variation.image);

            // upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Storage product in firebase
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch(e) {
      throw e.message;
    } on PlatformException catch(e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}