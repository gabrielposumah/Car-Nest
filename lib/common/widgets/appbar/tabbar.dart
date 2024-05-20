import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/device/device_utility.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GTabBar extends StatelessWidget implements PreferredSizeWidget {
  const GTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Gcolors.black : Gcolors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Gcolors.primary,
        labelColor: dark ? Gcolors.white : Gcolors.primary,
        unselectedLabelColor: Gcolors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}
