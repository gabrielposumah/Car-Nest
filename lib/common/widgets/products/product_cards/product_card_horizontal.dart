import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/icon/g_circular_icon.dart';
import 'package:product_share_suzuki/common/widgets/images/g_rounded_image.dart';
import 'package:product_share_suzuki/common/widgets/text/brand_title_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_price_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_title_text.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GProductCardHorizontal extends StatelessWidget {
  const GProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(Gsize.productImageRadius),
          color: dark ? Gcolors.darkerGrey : Gcolors.light),
      child: Row(
        children: [
          // Thumbnail
          GRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Gsize.sm),
            backgroundColor: dark ? Gcolors.dark : Gcolors.grey,
            child: const Stack(
              children: [
                // Thumbnail image
               const SizedBox(
                  width: 120,
                  height: 120,
                  child: GRoundedImage(
                      imageUrl: 'assets/images/xl7.png',
                      applyImageRadius: true),
                ),
                // Sale tag
                // Positioned(
                //   top: 12,
                //   child: GRoundedContainer(
                //     radius: Gsize.sm,
                //     backgroundColor: Gcolors.secondary.withOpacity(0.8),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: Gsize.sm, vertical: Gsize.xs),
                //     child: Text('25%',
                //         style: Theme.of(context)
                //             .textTheme
                //             .labelLarge!
                //             .apply(color: Gcolors.black)),
                //   ),
                // ),

                // Favorite Icon Button
                // const Positioned(
                //   top: 0,
                //   right: 0,
                //   child: GCircularIcon(
                //     icon: Iconsax.heart5,
                //     color: Colors.red,
                //   ),
                // )
              ],
            ),
          ),

          // Details
          const SizedBox(
            width: 172,
            child:  Column(
              children: [
              const  Padding(padding: EdgeInsets.only(top: Gsize.md, left: Gsize.sm),
                child: Column(
                  children: [
                    GProductTitleText(title: 'Grand Vitara MT', smallSize: true),
                    SizedBox(height: Gsize.spaceBtwItems/2),
                    GBrandTitleText(title: 'Suzuki')
                  ],
                )),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // PRicing
                   const Padding(padding: EdgeInsets.only(bottom: 10, left: 25), child:  GProductPriceText(price: ' 356.000.000')),

                    // Add to cart
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     color: Gcolors.dark,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(Gsize.cardRadiusMd),
                    //       bottomRight: Radius.circular(Gsize.productImageRadius)
                    //     ),
                    //   ),
                    //   child: const SizedBox(
                    //     width: Gsize.iconLG * 1.2,
                    //     height: Gsize.iconLG * 1.2,
                    //     child: Center(
                    //       child: Icon(Iconsax.add, color: Gcolors.white),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
