import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current  index when page scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 1){
      Get.to(const LoginScreen());

    }else {
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value=1;
    pageController.jumpToPage(1);
  }
}
