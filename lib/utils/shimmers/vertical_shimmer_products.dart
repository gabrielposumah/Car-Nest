import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/layout/grid_layout.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/shimmers/shimmers.dart';

class GVerticalProductShimmer extends StatelessWidget {
  const GVerticalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  GGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 188,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            GShimmerEffect(width: 180, height: 180),
            SizedBox(height: Gsize.spaceBtwItems),

            // Text
            GShimmerEffect(width: 160, height: 15),
            SizedBox(height: Gsize.spaceBtwItems/2),
            GShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}