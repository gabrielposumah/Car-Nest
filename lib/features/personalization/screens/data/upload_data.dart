import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/list_tile/setting_menu_tiles.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/features/personalization/screens/data/upload/upload_banners.dart';
import 'package:product_share_suzuki/features/personalization/screens/data/upload/upload_categories.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GUploadDataScreen extends StatelessWidget {
  const GUploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        showBackArrow: true,
        title: Text("Upload Data",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [
            // Body
            Padding(
              padding: const EdgeInsets.all(Gsize.defaulSpace),
              child: Column(
                children: [
                  // -- Account Setting
                  const GSectionHeading(
                    title: 'Main Records',
                    showActionButton: false,
                  ),
                  const SizedBox(height: Gsize.spaceBtwItems),

                  GSettingMenuTile(
                      icon: Iconsax.category,
                      title: 'Upload Categories',
                      subtitle: '',
                      onTap: () => Get.to(() =>  CategoryScreen())),
                  GSettingMenuTile(
                      icon: Iconsax.shop,
                      title: 'Upload Banners',
                      subtitle: '',
                      onTap: () => Get.to(() =>  GUploadBanners())),
                  GSettingMenuTile(
                      icon: Iconsax.shopping_cart4,
                      title: 'Products',
                      subtitle: '',
                      onTap: () {}),
                  GSettingMenuTile(
                      icon: Iconsax.image,
                      title: 'Brands',
                      subtitle: '',
                      onTap: () {}),

                  // // App setting
                  // const SizedBox(height: Gsize.spaceBtwSections),
                  // const GSectionHeading(
                  //     title: 'App Settings', showActionButton: false),
                  // const SizedBox(height: Gsize.spaceBtwItems),
                  //  GSettingMenuTile(
                  //   onTap: () => Get.to(() => const GUploadDataScreen()),
                  //     icon: Iconsax.document_upload,
                  //     title: 'Upload Data',
                  //     subtitle: 'Upload data to your Cloud Firebase'),
                  // GSettingMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'Geolocation',
                  //   subtitle: 'Set recommendation based on location',
                  //   trailing: Switch(value: true, onChanged: (value) {}),
                  // ),
              
                  // const SizedBox(height: Gsize.spaceBtwItems * 2.5)
                ],
              ),
            )
          ],
        ),
        ),
      );
  }
}
