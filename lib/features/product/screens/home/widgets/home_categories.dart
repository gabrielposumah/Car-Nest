import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/common/widgets/image_text/vertical_image_text.dart';
import 'package:product_share_suzuki/features/product/controllers/category_controller.dart';
import 'package:product_share_suzuki/features/product/screens/sub_category/sub_categories.dart';
import 'package:product_share_suzuki/utils/shimmers/category_shimmer.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(
      (){
        if(categoryController.isLoading.value) return const GCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty) {
          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }
        return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return GVerticalImage(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
      } 
    );
  }
}
