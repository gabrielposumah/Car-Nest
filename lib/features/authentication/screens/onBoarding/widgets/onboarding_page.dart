import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Gsize.defaulSpace),
      child: Column(
        children: [
          Image(
            width: GHelperFunctions.screenWidth() * 0.9,
            height: GHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: Gsize.spaceBtwItems),
          Text(subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
