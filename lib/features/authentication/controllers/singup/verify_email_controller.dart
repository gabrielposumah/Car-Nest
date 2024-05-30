import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/features/authentication/screens/verifyEmail/success_screen.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }

  // Send email verification link
  sendEmailVerification() async{
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Gloaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    } catch (e) {
      Gloaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  // TImer for automatically
  setTimeForAutoRedirect()  {
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false ) {
        timer.cancel();
        Get.off(()=>  const SuccessScreen());
      }
    });
  }

  // Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
      Get.off(()=> const SuccessScreen());
    }
  }
}