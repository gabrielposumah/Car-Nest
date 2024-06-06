import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/images/g_rounded_image.dart';
import 'package:product_share_suzuki/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(title: Text('Passenger'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            children: [
              // Banner
              GRoundedImage(
                  width: double.infinity,
                  imageUrl: 'assets/images/promo.png',
                  applyImageRadius: true),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Sub-category
              Column(
                children: [
                  // Heading
                  GSectionHeading(title: 'Grand Vitara', onPressed: () {}),
                  const SizedBox(height: Gsize.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: Gsize.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            const GProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
