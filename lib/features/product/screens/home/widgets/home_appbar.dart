import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

class GHomeAppBar extends StatelessWidget {
  const GHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Gabriel Posumah',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Gcolors.grey),
          ),
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
