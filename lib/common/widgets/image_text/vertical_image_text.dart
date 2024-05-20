import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GVerticalImage extends StatelessWidget {
  const GVerticalImage(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = Gcolors.white,
      this.backgroundColor = Gcolors.white,
      this.onTap});

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Gsize.spaceBtwItems),
        child: Column(
          children: [
            //Circular Icon
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(Gsize.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? Gcolors.black : Gcolors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  // color: dark ? Gcolors.light : Gcolors.dark
                ),
              ),
            ),

            const SizedBox(height: Gsize.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
