import 'package:flutter/material.dart';
import 'package:product_share_suzuki/features/authentication/controllers/controllers.onboarding/onBoarding.controller.dart';

import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: GDeviceUtils.getAppBarHeight(),
        right: Gsize.defaulSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text('Skip')));
  }
}
