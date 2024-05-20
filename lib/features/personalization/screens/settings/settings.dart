import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/primary_header_container.dart';
import 'package:product_share_suzuki/common/widgets/list_tile/setting_menu_tiles.dart';
import 'package:product_share_suzuki/common/widgets/list_tile/user_profile_tile.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/features/personalization/screens/address/address.dart';
import 'package:product_share_suzuki/features/personalization/screens/profile/profile.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            GPrimaryHeaderContainer(
                child: Column(
              children: [
                GAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Gcolors.white))),

                // User profile card
                GUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: Gsize.spaceBtwSections),
              ],
            )),

            // Body
            Padding(
              padding: const EdgeInsets.all(Gsize.defaulSpace),
              child: Column(
                children: [
                  // -- Account Setting
                  const GSectionHeading(
                    title: 'Account Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(height: Gsize.spaceBtwItems),

                  GSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set Shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  GSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subtitle: 'Set any kind of notification message',
                      onTap: () {}),
                  GSettingMenuTile(
                      icon: Iconsax.heart,
                      title: 'Favorite',
                      subtitle: 'Products you like',
                      onTap: () {}),
                  GSettingMenuTile(
                      icon: Iconsax.setting,
                      title: 'Settings',
                      subtitle: 'Change your account settings',
                      onTap: () {}),

                  // App setting
                  const SizedBox(height: Gsize.spaceBtwSections),
                  const GSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: Gsize.spaceBtwItems),
                  const GSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload data to your Cloud Firebase'),
                  GSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  //Logout Button
                  const SizedBox(height: Gsize.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: Gsize.spaceBtwItems * 2.5)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
