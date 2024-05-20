import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/device/device_utility.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GSearchContainer extends StatelessWidget {
  const GSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: Gsize.defaulSpace)});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: GDeviceUtils.getScreenWidht(context),
          padding: const EdgeInsets.all(Gsize.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? Gcolors.dark
                      : Gcolors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(Gsize.borderRadiusLg),
              border: showBorder ? Border.all(color: Gcolors.grey) : null),
          child: Row(
            children: [
              const Icon(Iconsax.search_normal, color: Gcolors.darkGrey),
              const SizedBox(width: Gsize.spaceBtwItems),
              Text('Search Our Product',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
