import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

class GCircularContainer extends StatelessWidget {
  const GCircularContainer(
      {super.key,
      this.widht = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.child,
      this.backgroundColor = Gcolors.white,
      this.margin});

  final double? widht;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      margin: margin,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
    // Container(
    //   width: 400,
    //   height: 400,
    //   padding: const EdgeInsets.all(0),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(400),
    //     color: Gcolors.white.withOpacity(0.1),
    //   ),
    // );
  }
}
