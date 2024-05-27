import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/controllers/controllers.onboarding/onBoarding.controller.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/widgets/onboarding_next_button.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: 'assets/gift/onBoarding1.gif',
                title: 'Choose Your Product',
                subTitle:
                    "Discover a wide range of cars from trusted dealers. Let's find your dream car!",
              ),
              OnBoardingPage(
                image: 'assets/gift/onBoarding2.gif',
                title: 'Easy Search',
                subTitle:
                    "Search and compare! Use filters to find and compare models, read reviews, and see photos. Simplify your car search",
              ),
            ],
          ),

          // Skip button
          const OnBoardingSkip(),
          // Dot navigation Smoothpageindicator
          const OnboardingDotNavigation(),
          // Circular button
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
