import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/images/g_circular_image.dart';
import 'package:product_share_suzuki/common/widgets/text/brand_title_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_price_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_title_text.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/enums.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GProductMetaData extends StatelessWidget {
  const GProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    // final darkMode = GHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & sale price
        Row(
          children: [
            // Sale tag
            GRoundedContainer(
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
            const SizedBox(width: Gsize.spaceBtwItems),

            // Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: Gsize.spaceBtwItems),
            const GProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: Gsize.spaceBtwItems / 1.5),

        // Title
        const GProductTitleText(title: 'Baleno AT'),
        const SizedBox(height: Gsize.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const GProductTitleText(title: 'Status'),
            const SizedBox(width: Gsize.spaceBtwItems),
            Text('In stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: Gsize.spaceBtwItems / 1.5),

        // Brand
        const Row(
          children: [
            GCircularImage(
              image: 'assets/logos/suzuki.png',
              width: 32,
              height: 32,
            ),
            GBrandTitleText(title: 'Suzuki', brandTextSizes: TextSizes.medium)
          ],
        ),
      ],
    );
  }
}
