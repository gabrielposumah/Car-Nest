import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class GShimmerEffect extends StatelessWidget {
  const GShimmerEffect({super.key, required this.width, required this.height,  this.radius = 15, this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors( baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!, 
    highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? (dark ? Gcolors.darkerGrey : Gcolors.white),
        borderRadius: BorderRadius.circular(radius),
      ),
     ) );
  }
}