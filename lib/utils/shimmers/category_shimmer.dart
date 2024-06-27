import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/shimmers/shimmers.dart';

class GCategoryShimmer extends StatelessWidget {
  const GCategoryShimmer({super.key,  this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: Gsize.spaceBtwItems), 
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              GShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: Gsize.spaceBtwItems / 2),

              // Text
              GShimmerEffect(width: 55, height: 8)
            ],
          );
        }, ),
    );
  }
}