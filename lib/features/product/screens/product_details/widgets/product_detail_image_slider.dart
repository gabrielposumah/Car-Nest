import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/curved_edges/curved_edge_widgets.dart';
import 'package:product_share_suzuki/common/widgets/icon/g_circular_icon.dart';
import 'package:product_share_suzuki/common/widgets/images/g_rounded_image.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GProductImageSlider extends StatelessWidget {
  const GProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return GCurvedEdgeWidget(
      child: Container(
          color: dark ? Gcolors.darkerGrey : Gcolors.light,
          child: Stack(children: [
            // Main large Image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(Gsize.productImageRadius * 2),
                  child: Image(image: AssetImage('assets/images/baleno.png')),
                )),

            // Image
            Positioned(
              right: 0,
              bottom: 30,
              left: Gsize.defaulSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: Gsize.spaceBtwItems),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => GRoundedImage(
                    imageUrl: 'assets/images/xl7.png',
                    width: 80,
                    backgroundColor: dark ? Gcolors.dark : Gcolors.white,
                    border: Border.all(color: Gcolors.primary),
                    padding: const EdgeInsets.all(Gsize.sm),
                  ),
                ),
              ),
            ),
            // Appbar Icons
            const GAppBar(
              showBackArrow: true,
              actions: [
                GCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ])),
    );
  }
}
