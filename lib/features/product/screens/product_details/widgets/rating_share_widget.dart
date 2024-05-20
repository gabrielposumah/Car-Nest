import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GRatingAndShare extends StatelessWidget {
  const GRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: Gsize.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(199)'),
            ])),
          ],
        ),

        // Icon Button
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: Gsize.iconMd)),
      ],
    );
  }
}
