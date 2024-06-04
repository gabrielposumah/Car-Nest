
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/user/user_repository.dart';
import 'package:product_share_suzuki/features/authentication/controllers/users/user_controller.dart';
import 'package:product_share_suzuki/features/personalization/screens/profile/profile.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';
import 'package:product_share_suzuki/utils/popups/full_screen_loader.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog('We are updating your information', 'assets/gift/onBoarding.gif');

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        GFullScreenLoader.stopLoading();
        return ;

        }
      // form Validation
        if(!updateUserNameFormKey.currentState!.validate()) {
          GFullScreenLoader.stopLoading();
          return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FistName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Remove loader
      GFullScreenLoader.stopLoading();
      
      // Show success message
      Gloaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      // Move to previous screen.
      Get.off(() => const ProfileScreen());

    } catch(e) {
      GFullScreenLoader.stopLoading();
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}