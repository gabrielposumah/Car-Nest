import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/data/repositories/user/user_repository.dart';
import 'package:product_share_suzuki/features/authentication/models/users/user_model.dart';
import 'package:product_share_suzuki/features/authentication/screens/verifyEmail/verify_email.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';
import 'package:product_share_suzuki/utils/popups/full_screen_loader.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final privacyPolicy = true.obs;

  // Signup
  void signup() async {
    try {
      // Start loading
      GFullScreenLoader.openLoadingDialog('We are processing your information', 'https://lottie.host/f523c28e-ab0c-45c8-97b9-ef8ae667bba7/gE0unhlt82.json');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      // Form validation
      if(!signupFormKey.currentState!.validate()) return;

      // privacy policy check
      if(!privacyPolicy.value) {
        Gloaders.warningSnackBar(title: 'Accept Privacy Policy',
        message: 'In Order to create account, you must have to read and accept the Privacy Policy & Term Condtion');
        return;
      }

      // Register user in firebase Authentication & save user data in the Firebase
      final UserCredential  = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in firebase firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        email: email.text.trim(),
        username: username.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(), profilePicture: 'https://i.pravatar.cc/300',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // remove loader
      GFullScreenLoader.stopLoading();

      // Show success message
      Gloaders.successSnackBar(title: 'Congratulaions', message: 'Your account has been created!');

      // Move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

    } catch (e){
      // Show some generic error to the user
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      GFullScreenLoader.stopLoading();
    }
  }
}