import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';
import 'package:product_share_suzuki/features/authentication/controllers/singup/verify_email_controller.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logOut(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            children: [
              // Lottie.network(
              //     'https://lottie.host/2a04a737-2335-4f7a-bbe0-d90ef3592236/3E4Oph99mK.json',
              //     width: GHelperFunctions.screenHeight() * 0.6),
              // const SizedBox(height: Gsize.spaceBtwSections),
              Image(
                  image: const AssetImage('assets/images/success.jpg'),
                  width: GHelperFunctions.screenHeight() * 0.6),
              const SizedBox(height: Gsize.spaceBtwSections),
              // Title & sub title
              Text(
                'Verifiy Your Email',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Gsize.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Gsize.spaceBtwItems),
              Text(
                'Congratulations! Your Account Awaits: Verify Your Email to Start To Use This App',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: Gsize.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text('Resend Email'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
