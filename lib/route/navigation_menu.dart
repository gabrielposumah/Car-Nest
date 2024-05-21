import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/features/personalization/screens/settings/settings.dart';
import 'package:product_share_suzuki/features/product/screens/home/home.dart';
import 'package:product_share_suzuki/features/product/screens/product/product.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Gcolors.black : Colors.white,
          indicatorColor: darkMode
              ? Gcolors.white.withOpacity(0.1)
              : Gcolors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.car), label: 'Compare'),
            NavigationDestination(icon: Icon(Iconsax.bank), label: 'Leasing'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ProductScreen(),
    Container(color: Colors.orange),
    const SettingsScreens(),
  ];
}
