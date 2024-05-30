import 'package:flutter/material.dart';

import 'package:product_share_suzuki/common/styles/spacing_styles.dart';
import 'package:product_share_suzuki/data/repositories/authentication/authentication_repository.dart';

import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: GSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            Image(image: const AssetImage('assets/images/success.png'), width: GHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: Gsize.spaceBtwSections),

            // Title
             Text('Your account successfully created!', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: Gsize.spaceBtwItems),
            Text('Welcome to your Suzuki Comparring app, Your Accoun is Created!', style : Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: Gsize.spaceBtwSections),

            // Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => AuthenticationRepository.instance.screenRedirect(), child: const Text("Continue"),),),
            const SizedBox(height: Gsize.spaceBtwItems),
          
          ],
        ),),
      ),
    );
  }
}