import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/features/authentication/controllers.onboarding/onBoarding.controller.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/device/device_utility.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Positioned(
        right: Gsize.defaulSpace,
        bottom: GDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? Gcolors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3, color: Colors.white,),
        ));
  }
}
