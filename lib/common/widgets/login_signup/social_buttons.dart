import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

import '../../../utils/constants/size.dart';

class GWidgetSocialButtons extends StatelessWidget {
  const GWidgetSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Gcolors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: Gsize.iconMd,
              height: Gsize.iconMd,
              image: AssetImage(''),
            ),
          ),
        ),
        const SizedBox(
          width: Gsize.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Gcolors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: Gsize.iconMd,
              height: Gsize.iconMd,
              image: AssetImage(''),
            ),
          ),
        ),
      ],
    );
  }
}
