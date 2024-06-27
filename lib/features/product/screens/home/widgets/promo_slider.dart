import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/circular_container.dart';
import 'package:product_share_suzuki/common/widgets/images/g_rounded_image.dart';
import 'package:product_share_suzuki/features/product/controllers/banner_controller.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/shimmers/shimmers.dart';

class GPromoSlider extends StatelessWidget {
  const GPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loaders
      if (controller.isLoading.value)
        // ignore: curly_braces_in_flow_control_structures
        return const GShimmerEffect(width: double.infinity, height: 190);

      // No data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => GRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen)))
                  .toList(),
            ),
            const SizedBox(
              height: Gsize.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      GCircularContainer(
                        widht: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? Gcolors.primary
                                : Gcolors.grey,
                      )
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
