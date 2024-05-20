import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/appbar/tabbar.dart';
import 'package:product_share_suzuki/common/widgets/brands/brand_card.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/search_container.dart';
import 'package:product_share_suzuki/common/widgets/layout/grid_layout.dart';
import 'package:product_share_suzuki/features/product/screens/product/widgets/category_tab.dart';
import 'package:product_share_suzuki/features/product/screens/product/widgets/section_heading_product.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: GAppBar(
          title: Text('Product',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.notification5))
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: GHelperFunctions.isDarkMode(context)
                    ? Gcolors.black
                    : Gcolors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Gsize.defaulSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // -- Search bar
                      const SizedBox(height: Gsize.spaceBtwItems),
                      const GSearchContainer(
                        text: '',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: Gsize.spaceBtwSections),

                      //  -- Features brands
                      GSectionHeading(title: 'Our Products', onPressed: () {}),
                      const SizedBox(height: Gsize.spaceBtwItems / 1.5),

                      GGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const GBrandCard(showBorder: true);
                          })
                    ],
                  ),
                ),
                bottom: const GTabBar(tabs: [
                  Tab(child: Text('Jimny')),
                  Tab(child: Text('Grand Vitara')),
                  Tab(child: Text('Baleno')),
                  Tab(child: Text('XL7')),
                  Tab(child: Text('Ertiga')),
                  Tab(child: Text('Ignis')),
                  Tab(child: Text('Esspresso')),
                ]),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              GCategoryTab(),
              GCategoryTab(),
              GCategoryTab(),
              GCategoryTab(),
              GCategoryTab(),
              GCategoryTab(),
              GCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
