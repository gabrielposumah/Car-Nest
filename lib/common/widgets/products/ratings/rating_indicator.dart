import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class GRatingBarIndicator extends StatelessWidget {
  const GRatingBarIndicator({super.key, required this.rating});
  
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(itemBuilder: (_, __) => const  Icon(Iconsax.star1, color: Gcolors.primary),
           rating: rating,
           itemSize: 20,
           unratedColor: Gcolors.grey,);
  }
}