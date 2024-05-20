import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/common/widgets/products/ratings/rating_indicator.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Column(
      children:  [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/images/foto_profile.png')),
                const SizedBox(width: Gsize.spaceBtwItems),
                Text('Joh Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {
              
            }, icon: const Icon(Icons.more_vert)),

          ],
        ),

        // Review
        Row(
          children: [
            const GRatingBarIndicator(rating: 4),
            const SizedBox(width: Gsize.spaceBtwItems),
            Text('01 November 2024', style: Theme.of(context).textTheme.bodyMedium),

          ],
        ),
        const SizedBox(height: Gsize.spaceBtwItems),
        const ReadMoreText('The User inteface of app is quite intuitive. I was able to navigates and make purchase seamlessly.',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' show less',
        trimCollapsedText: ' shoe more',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Gcolors.primary),
        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Gcolors.primary),
        ),

        const SizedBox(height: Gsize.spaceBtwItems),

        // Company Review
        GRoundedContainer(
          backgroundColor: dark ? Gcolors.darkGrey : Gcolors.grey,
          child: Padding(padding: const EdgeInsets.all(Gsize.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Suzuki', style: Theme.of(context).textTheme.bodyLarge),
                  Text('07 April 2000', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: Gsize.spaceBtwItems),
        const ReadMoreText('The User inteface of app is quite intuitive. I was able to navigates and make purchase seamlessly.',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' show less',
        trimCollapsedText: ' shoe more',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Gcolors.primary),
        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Gcolors.primary),
        ),

            ],
          ),),
        ),

        const SizedBox(height: Gsize.spaceBtwSections),
        
      ],
    );
  }
}