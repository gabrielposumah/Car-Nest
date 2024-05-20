import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/images/g_circular_image.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

class GUserProfileTile extends StatelessWidget {
  const GUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const GCircularImage(
          image: 'assets/images/foto_profile.png',
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text('Gabriel',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Gcolors.white)),
        subtitle: Text('gjposumah@gmail.com',
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
