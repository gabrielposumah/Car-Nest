import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/product/controllers/category_controller.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: categoryController.categoryNameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
              ),
            ),
            TextField(
              controller: categoryController.categoryParentIdController,
              decoration: InputDecoration(
                labelText: 'Parent ID',
              ),
            ),
            Obx(() {
              return categoryController.pickedImage.value == null
                  ? TextButton.icon(
                      icon: Icon(Icons.image),
                      label: Text('Pick Image'),
                      onPressed: categoryController.pickImage,
                    )
                  : Image.file(
                      categoryController.pickedImage.value!,
                      height: 200,
                    );
            }),
            Obx(() {
              return SwitchListTile(
                title: Text('Is Featured'),
                value: categoryController.isCategoryFeatured.value,
                onChanged: (value) {
                  categoryController.isCategoryFeatured.value = value;
                },
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: categoryController.saveCategory,
              child: Text('Create Category'),
            ),
          ],
        ),
      ),
    );
  }
}