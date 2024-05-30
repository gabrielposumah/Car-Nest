import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GFullScreenLoader {
  // open a full screen loading dialog with a given text and animation
  // this method doesn't return anything
  //
  // Parameters:
  // - text : The text to be displayed in the loading dialog
  // - animation : The lotie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(context: Get.overlayContext!,
    barrierDismissible: false,
    
     builder: (__) => PopScope(
      canPop: false,
      child: Container(
        color: GHelperFunctions.isDarkMode(Get.context!) ? Gcolors.dark : Gcolors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            SizedBox(height: 250),
            
          ],
        ),
      )));
  }

  static void stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}