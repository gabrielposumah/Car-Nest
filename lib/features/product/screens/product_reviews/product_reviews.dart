import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';

class GProductReviews extends StatelessWidget {
  const GProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: GAppBar(
        title: Text('Review & Ratings'),
      ),

      // Body
      body: SingleChildScrollView(),
    );
  }
}
