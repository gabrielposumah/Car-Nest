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
import 'package:product_share_suzuki/features/product/controllers/product_controller.dart';
import 'package:product_share_suzuki/features/product/models/product_model.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/product_detail.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/enums/enums.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
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
                  GRoundedImage(
                      // padding: EdgeInsets.only(top: 50),
                      imageUrl: product.thumbnail,
                      applyImageRadius: true),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: GRoundedContainer(
                      radius: Gsize.sm,
                      backgroundColor: Gcolors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Gsize.sm, vertical: Gsize.xs),
                      child: Text('$salePercentage',
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
            Padding(
              padding: const EdgeInsets.only(left: Gsize.sm),
              child: Column(
                children: [
                  GProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: Gsize.spaceBtwItems / 2),
                  GBrandTitleWithVerifiedIcon(title: product.brand!.name)
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
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: Gsize.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: Gsize.sm),
                        child:
                            GProductPriceText(price: product.price.toString()),
                      ),
                    ],
                  ),
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
