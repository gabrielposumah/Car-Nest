import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/primary_header_container.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/search_container.dart';
import 'package:product_share_suzuki/common/widgets/layout/grid_layout.dart';
import 'package:product_share_suzuki/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/features/product/screens/all_product/all_products.dart';
import 'package:product_share_suzuki/features/product/screens/home/widgets/home_appbar.dart';
import 'package:product_share_suzuki/features/product/screens/home/widgets/home_categories.dart';
import 'package:product_share_suzuki/features/product/screens/home/widgets/promo_slider.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            const GPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App bar
                  GHomeAppBar(),
                  SizedBox(height: Gsize.spaceBtwSections),

                  // Search Bar
                  GSearchContainer(text: 'Search Our Product'),
                  SizedBox(height: Gsize.spaceBtwSections),

                  // Categories Product
                  Padding(
                    padding: EdgeInsets.only(left: Gsize.defaulSpace),
                    child: Column(children: [
                      //Heading
                      GSectionHeading(
                          title: 'Categories',
                          showActionButton: false,
                          textColor: Colors.white),
                      SizedBox(height: Gsize.spaceBtwItems),

                      //Categories
                      GHomeCategories()
                    ]),
                  )
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(Gsize.defaulSpace),
              child: Column(
                children: [
                  // Prom Slider
                  const GPromoSlider(
                    banners: [
                      'assets/images/promo.png',
                      'assets/images/promo.png',
                      'assets/images/promo.png',
                    ],
                  ),
                  const SizedBox(height: Gsize.spaceBtwSections),

                  // Heading
                  GSectionHeading(title: 'All Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: Gsize.spaceBtwSections),

                  // Popular Products
                  GGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const GProductCardVertical(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
