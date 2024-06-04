import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/features/authentication/controllers/users/user_controller.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/shimmers/shimmers.dart';

class GHomeAppBar extends StatelessWidget {
  const GHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return GAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back Dude!',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Gcolors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // display a shimmer loader while user profile is being loaded
              return const GShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
              );
            }
          })
        ],
      ),
      actions: [
        Stack(children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.profile_2user,
                color: Colors.white,
              )),
        ]),
      ],
    );
  }
}
