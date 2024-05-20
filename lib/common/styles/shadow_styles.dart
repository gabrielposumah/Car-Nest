import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

class GShadowStyles {
  static final verticalProductShadow = BoxShadow(
      color: Gcolors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: Gcolors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
