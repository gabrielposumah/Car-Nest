import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_share_suzuki/data/repositories/banners/banner_repository.dart';
import 'package:product_share_suzuki/features/product/models/banner_model.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class BannerController extends GetxController {
  // static BannerController instance => Get.find();

  // Final variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update page navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
  
  // Fetch banners
   Future<void> fetchBanners() async {
    try {

      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Asign banners
      this.banners.assignAll(banners);

    } catch (e){
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  var targetScreenController = TextEditingController();
  var isActive = false.obs;
  final ImagePicker _picker = ImagePicker();
  var pickedImage = Rxn<File>();

  // Pick image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  // Save banner
  void saveBanner() async {
    if (pickedImage.value == null) {
      Get.snackbar('Error', 'No image selected');
      return;
    }

    try {
      final banner = BannerModel(
        imageUrl: '',
        targetScreen: targetScreenController.text,
        active: isActive.value,
      );

      await bannerRepository.addBanner(banner, pickedImage.value!);

      Get.snackbar('Success', 'Banner saved successfully!');
      fetchBanners();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save banner: $e');
    }
  }
}



