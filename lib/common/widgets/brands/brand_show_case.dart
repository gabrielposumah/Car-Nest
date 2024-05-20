import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/brands/brand_card.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GBrandShowCase extends StatelessWidget {
  const GBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GRoundedContainer(
      showBorder: true,
      borderColor: Gcolors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(Gsize.md),
      margin: const EdgeInsets.only(bottom: Gsize.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Products count
          const GBrandCard(showBorder: false),
          const SizedBox(height: Gsize.spaceBtwItems),

          // Brand top 3 product images
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: GRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(Gsize.md),
      margin: const EdgeInsets.only(right: Gsize.sm),
      backgroundColor: GHelperFunctions.isDarkMode(context)
          ? Gcolors.darkerGrey
          : Gcolors.light,
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
      ),
    ));
  }
}
