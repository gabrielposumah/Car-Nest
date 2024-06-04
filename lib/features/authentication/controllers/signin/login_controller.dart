import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/features/authentication/controllers/users/user_controller.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';
import 'package:product_share_suzuki/utils/popups/full_screen_loader.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class LoginController extends GetxController {

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  // @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  // }

  /// Email and password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog('Logging you in...', 'assets/gift/onBoarding2/gif');

      // Check the internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        GFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if(!loginFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using email and paswsword authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());


      // remove loader
      GFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch(e) {
      GFullScreenLoader.stopLoading();
      Gloaders.errorSnackBar(title: 'Oh snap!', message: e.toString());

    }
  }

  // Google signin authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog('Logging you in', 'assets/gift/onBoarding2.gif');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        GFullScreenLoader.stopLoading();
        return;
      }

      // Login user using google authentication
      final userCredentials =  await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      GFullScreenLoader.stopLoading();

      // Redirect 
      AuthenticationRepository.instance.screenRedirect();

    } catch(e) {
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}