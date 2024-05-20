import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/images/g_circular_image.dart';
import 'package:product_share_suzuki/common/widgets/text/brand_title_text.dart';
import 'package:product_share_suzuki/utils/constants/enums.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GBrandCard extends StatelessWidget {
  const GBrandCard({super.key, required this.showBorder, this.onTap});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Container desain
      child: GRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(Gsize.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            const Flexible(
              child: GCircularImage(
                image: 'assets/logos/suzuki.png',
                backgroundColor: Colors.transparent,
              ),
            ),

            const SizedBox(width: Gsize.spaceBtwItems / 2),

            // Text
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GBrandTitleText(
                    title: 'Suzuki', brandTextSizes: TextSizes.large),
                Text(
                  '10 Products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
