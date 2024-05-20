import 'package:flutter/material.dart';

import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/products/ratings/rating_indicator.dart';
import 'package:product_share_suzuki/features/product/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:product_share_suzuki/features/product/screens/product_reviews/widgets/user_review_card.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GProductReviews extends StatelessWidget {
  const GProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: const GAppBar(
        title: Text('Review & Ratings'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and review are verified and are from people who use the same type of deivce that you use'),
              const SizedBox(height: Gsize.spaceBtwItems),

              //Overlay product ratings
              const GOverallProductRating(),
              const GRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: Gsize.spaceBtwSections),

              // User review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
