import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/widgets/product_attributes.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/widgets/product_meta_data.dart';
import 'package:product_share_suzuki/features/product/screens/product_details/widgets/rating_share_widget.dart';
import 'package:product_share_suzuki/features/product/screens/product_reviews/product_reviews.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const GBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image slider
            const GProductImageSlider(),

            // Product details
            Padding(
              padding: const EdgeInsets.only(
                  right: Gsize.defaulSpace,
                  left: Gsize.defaulSpace,
                  bottom: Gsize.defaulSpace),
              child: Column(
                children: [
                  // Rating & share button
                  const GRatingAndShare(),

                  // Price, title, Stock & brand
                  const GProductMetaData(),

                  // Atributes
                  const GProductAttributes(),

                  // Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: Gsize.spaceBtwItems),

                  // Description
                  const GSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: Gsize.spaceBtwItems),
                  const ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: Gsize.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const GProductReviews()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: Gsize.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
