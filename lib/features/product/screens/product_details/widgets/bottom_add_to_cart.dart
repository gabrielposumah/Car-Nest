import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/icon/g_circular_icon.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GBottomAddToCart extends StatelessWidget {
  const GBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Gsize.defaulSpace, vertical: Gsize.defaulSpace / 2),
      decoration: BoxDecoration(
          color: dark ? Gcolors.darkerGrey : Gcolors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Gsize.cardRadiusLg),
            topRight: Radius.circular(Gsize.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const GCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: Gcolors.darkGrey,
                width: 40,
                height: 40,
                color: Gcolors.white,
              ),
              const SizedBox(width: Gsize.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: Gsize.spaceBtwItems),
              const GCircularIcon(
                icon: Iconsax.add,
                backgroundColor: Gcolors.black,
                width: 40,
                height: 40,
                color: Gcolors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(Gsize.md),
                  backgroundColor: Gcolors.black,
                  side: const BorderSide(color: Colors.black)),
              child: const Text('Add To Cart'))
        ],
      ),
    );
  }
}
