import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/images/g_circular_image.dart';
import 'package:product_share_suzuki/features/authentication/controllers/users/user_controller.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/shimmers/shimmers.dart';

class GUserProfileTile extends StatelessWidget {
  const GUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
        leading:   Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : 'assets/images/foto_profile.png';

                      return controller.imageUploading.value
                          ? const GShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : GCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );}
        ),
        title: Text(controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Gcolors.white)),
        subtitle: Text(controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Gcolors.white)),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Iconsax.edit,
              color: Gcolors.white,
            )));
  }
}
