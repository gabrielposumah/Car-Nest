import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/image_text/vertical_image_text.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GVerticalImage(
            image: 'assets/images/xl7.png',
            title: 'Passenger',
            onTap: () {},
          );
        },
      ),
    );
  }
}
