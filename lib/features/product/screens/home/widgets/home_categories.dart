import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/common/widgets/image_text/vertical_image_text.dart';
import 'package:product_share_suzuki/features/product/screens/sub_category/sub_categories.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GVerticalImage(
            image: 'assets/images/xl7.png',
            title: 'Passenger',
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
