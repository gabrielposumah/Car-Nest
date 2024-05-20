import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/container/rounded_container.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GSingleAddress extends StatelessWidget {
  const GSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return GRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(Gsize.md),
      backgroundColor: selectedAddress
          ? Gcolors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? Gcolors.darkerGrey
              : Gcolors.grey,
      margin: const EdgeInsets.only(bottom: Gsize.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? Gcolors.light
                      : Gcolors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gabriel',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Gsize.sm / 2),
              const Text('(+62) 822 9668 0310',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: Gsize.sm / 2),
              const Text(
                  '95962 Kanonang, Kabupaten Minahasa, Sulawesi Utara, Indonesia',
                 softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
