import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/constants/text_strings.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';

class GloginHeader extends StatelessWidget {
  const GloginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? Gimages.lightDarkLogo : Gimages.darkAppLogo),
        ),
        const SizedBox(height: Gsize.sm),
        Text(
          Gtexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Gsize.sm),
        Text(
          Gtexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
