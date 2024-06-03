import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/data/repositories/user/user_repository.dart';
import 'package:product_share_suzuki/features/authentication/models/users/user_model.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/login.dart';
import 'package:product_share_suzuki/features/personalization/screens/profile/widgets/re_authentication_users_login_fomr.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';
import 'package:product_share_suzuki/utils/popups/full_screen_loader.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final userName =
            UserModel.generateUserName(userCredentials.user!.displayName ?? '');

        // Map data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Gloaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information, You can re-save your data in your profile');
    }
  }

  // Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(Gsize.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Gsize.lg),
              child: Text('Delete')),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  // delete user account
  void deleteUserAccount() async {
    try {
      GFullScreenLoader.openLoadingDialog(
          'Processing', 'assets/gift/onBoarding2.gif');

      // first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.loginWithEmailAndPassword;
          await auth.deleteAccount();
          GFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          GFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticationUsersLoginFomr());
        }
      }
    } catch (e) {
      GFullScreenLoader.stopLoading();
      Gloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re Authenticate before deleting
  Future<void> reAuthenticationEmailAndPassword() async {
    try {
      GFullScreenLoader.openLoadingDialog(
        'Processing', 'assets/gift/onBoarding2.gif');

    // Check internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      GFullScreenLoader.stopLoading();
      return;
    }

    if(!reAuthFormKey.currentState!.validate()) {
      GFullScreenLoader.stopLoading();
      return;
    } 
    
    await AuthenticationRepository.instance.reAuthenticationEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
    await AuthenticationRepository.instance.deleteAccount();
    GFullScreenLoader.stopLoading();
    Get.offAll(() => const LoginScreen());
    } catch (e) {
      GFullScreenLoader.stopLoading();
      Gloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  } 
}
