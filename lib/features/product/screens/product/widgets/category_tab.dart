import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/brands/brand_show_case.dart';
import 'package:product_share_suzuki/common/widgets/layout/grid_layout.dart';
import 'package:product_share_suzuki/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';
import 'package:product_share_suzuki/features/product/screens/product/widgets/section_heading_product.dart';
import 'package:product_share_suzuki/utils/constants/image_strings.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GCategoryTab extends StatelessWidget {
  const GCategoryTab({super.key,  required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(Gsize.defaulSpace),
            child: Column(
              children: [
                // Brands
                const GBrandShowCase(
                    images: [Gimages.xl7, 'assets/images/ignis.png']),

                // Products
                GSectionHeading(title: 'You might like', onPressed: () {}),
                const SizedBox(height: Gsize.spaceBtwItems),

                GGridLayout(
                    itemCount: 5,
                    itemBuilder: (_, index) => const GProductCardVertical()),
                const SizedBox(height: Gsize.spaceBtwSections),
              ],
            ),
          ),
        ]);
  }
}
