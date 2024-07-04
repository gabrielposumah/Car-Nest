import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/product/controllers/banner_controller.dart';


class GUploadBanners extends StatelessWidget {
  const GUploadBanners({super.key});

   @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Banner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Obx(() {
              return controller.pickedImage.value == null
                  ? TextButton.icon(
                      icon: const Icon(Icons.image),
                      label: const Text('Pick Image'),
                      onPressed: controller.pickImage,
                    )
                  : Image.file(
                      controller.pickedImage.value!,
                      height: 200,
                    );
            }),
            
            const SizedBox(height: 20.0),
            TextField(
              controller: controller.targetScreenController,
              decoration: const InputDecoration(
                labelText: 'Target Screen',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                const Text('Active'),
                Obx(() {
                  return Checkbox(
                    value: controller.isActive.value,
                    onChanged: (value) {
                      controller.isActive.value = value ?? false;
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: controller.saveBanner,
              child: const Text('Upload Banner'),
            ),
          ],
        ),
          
        ),
      );
    
  }
}