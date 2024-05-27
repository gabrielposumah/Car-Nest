import 'package:flutter/material.dart';
import 'package:product_share_suzuki/features/authentication/controllers/controllers.onboarding/onBoarding.controller.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/device/device_utility.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = GHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: GDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: Gsize.defaulSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 2,
          effect:  ExpandingDotsEffect(
              activeDotColor: dark ? Gcolors.light : Gcolors.dark,
              dotHeight: 6),
        ));
  }
}
