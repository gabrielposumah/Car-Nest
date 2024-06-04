import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GWidgetsFormDivider extends StatelessWidget {
  const GWidgetsFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? Gcolors.darkGrey : Gcolors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          'or sign in with',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? Gcolors.darkGrey : Gcolors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
        const SizedBox(height: Gsize.spaceBtwSections,)
      ],
    );
  }
}
