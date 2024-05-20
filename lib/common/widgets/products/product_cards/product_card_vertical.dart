import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/styles/shadow_styles.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/icon/g_circular_icon.dart';
import 'package:product_share_suzuki/common/widgets/images/g_rounded_image.dart';
import 'package:product_share_suzuki/common/widgets/text/brand_title_text_verified.dart';
import 'package:product_share_suzuki/common/widgets/text/product_price_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_title_text.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/product_detail.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [GShadowStyles.verticalProductShadow],
          borderRadius: BorderRadius.circular(Gsize.productImageRadius),
          color: dark ? Gcolors.darkGrey : Gcolors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, Whislist button, discount tag
            GRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(Gsize.sm),
              backgroundColor: dark ? Gcolors.dark : Gcolors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  const GRoundedImage(
                      padding: EdgeInsets.only(top: 50),
                      imageUrl: 'assets/images/grand_vitara.png',
                      applyImageRadius: true),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: GRoundedContainer(
                      radius: Gsize.sm,
                      backgroundColor: Gcolors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Gsize.sm, vertical: Gsize.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Gcolors.black)),
                    ),
                  ),

                  // Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: GCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),

            // Details
            const Padding(
              padding: EdgeInsets.only(left: Gsize.sm),
              child: Column(
                children: [
                  GProductTitleText(title: 'Grand Vitara AT', smallSize: true),
                  SizedBox(height: Gsize.spaceBtwItems / 2),
                  GBrandTitleWithVerifiedIcon(title: 'Suzuki')
                ],
              ),
            ),

            // Spacer to keep height of each Box same in case 1 or 2 lines of heading
            const Spacer(),

            // Price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                const Padding(
                  padding: EdgeInsets.only(left: Gsize.sm),
                  child: GProductPriceText(price: '125.000'),
                ),

                // Add cart button
                Container(
                  decoration: const BoxDecoration(
                      color: Gcolors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Gsize.cardRadiusMd),
                          bottomRight:
                              Radius.circular(Gsize.productImageRadius))),
                  child: const SizedBox(
                      width: Gsize.iconLG * 1.2,
                      height: Gsize.iconLG * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: Gcolors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
