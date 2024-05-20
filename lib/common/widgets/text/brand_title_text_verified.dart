import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/text/brand_title_text.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/enums.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GBrandTitleWithVerifiedIcon extends StatelessWidget {
  const GBrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = Gcolors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: GBrandTitleText(
                title: title,
                color: textColor,
                maxLines: maxLines,
                textAlign: textAlign,
                brandTextSizes: brandTextSize)),
        const SizedBox(width: Gsize.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: Gsize.iconXs,
        )
      ],
    );
  }
}
