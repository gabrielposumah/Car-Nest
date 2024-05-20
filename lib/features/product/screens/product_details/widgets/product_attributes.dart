import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/chips/choice_chip.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/text/product_price_text.dart';
import 'package:product_share_suzuki/common/widgets/text/product_title_text.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GProductAttributes extends StatelessWidget {
  const GProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // -- Selected Attributes Pricing & Description
        GRoundedContainer(
          padding: const EdgeInsets.all(Gsize.md),
          backgroundColor: dark ? Gcolors.darkerGrey : Gcolors.grey,
          child: Column(
            children: [
              // Title, price and stock status
              Row(
                children: [
                  const GSectionHeading(
                      title: 'Variaton', showActionButton: false),
                  const SizedBox(width: Gsize.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const GProductTitleText(
                              title: 'Price : ', smallSize: true),

                          // Actual Price
                          Text(
                            '\$125',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: Gsize.spaceBtwItems),

                          // Sale Price
                          const GProductPriceText(price: '26'),
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const GProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Variant Description
              const GProductTitleText(
                  title:
                      'This is the Description of the Product and it can go up to max 4 lines',
                  maxLines: 4,
                  smallSize: true),
            ],
          ),
        ),
        const SizedBox(height: Gsize.spaceBtwItems),

        // -- Attributes
        Column(
          children: [
            const GSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: Gsize.spaceBtwItems / 2),
            Wrap(
              spacing: 6,
              children: [
                GChoiceChip(
                    text: 'White', selected: true, onSelected: (value) {}),
                GChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                GChoiceChip(
                    text: 'Red', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GSectionHeading(title: 'Type', showActionButton: false),
            const SizedBox(height: Gsize.spaceBtwItems / 2),
            Wrap(
              spacing: 6,
              children: [
                GChoiceChip(text: 'AT', selected: true, onSelected: (value) {}),
                GChoiceChip(
                    text: 'MT', selected: false, onSelected: (value) {}),
                GChoiceChip(
                    text: 'Alpha', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
