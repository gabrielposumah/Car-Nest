import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/login.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            children: [
              // Image
              Image(
                  image: const AssetImage('assets/images/reset_password.jpg'),
                  width: GHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Email & title
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: Gsize.spaceBtwItems),
              Text('Password reset email sent',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: Gsize.spaceBtwItems),
              Text('We Sent You a Secure Link to Safely Change Your Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text('Submit')),
              ),
              const SizedBox(height: Gsize.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => ForgotPasswordController.instance
                        .ressendPasswordResetEmail(email),
                    child: const Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
