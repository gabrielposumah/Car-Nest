import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/features/authentication/screens/reset_password/reset_password_screen.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';
import 'package:product_share_suzuki/utils/popups/full_screen_loader.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send Reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog(
          'Logging you in', 'assets/gift/onBoarding2.gif');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      // remove loader
      GFullScreenLoader.stopLoading();

      // show succes message
      Gloaders.successSnackBar(
          title: 'Email sent',
          message: 'Email link sent to reset your password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      GFullScreenLoader.stopLoading();
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ressendPasswordResetEmail(String email) async {
   try {
      // start loading
      GFullScreenLoader.openLoadingDialog(
          'Logging you in', 'assets/gift/onBoarding2.gif');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);
      // remove loader
      GFullScreenLoader.stopLoading();

      // show succes message
      Gloaders.successSnackBar(
          title: 'Email sent',
          message: 'Email link sent to reset your password'.tr);

    
    } catch (e) {
      // remove loader
      GFullScreenLoader.stopLoading();
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
