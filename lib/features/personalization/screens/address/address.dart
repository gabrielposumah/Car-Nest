
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/features/personalization/screens/address/widgets/single_address.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(() => const AddNewAddressScreen()),
      backgroundColor: Gcolors.primary,
      child: const Icon(Iconsax.add, color: Gcolors.white)),
      appBar: GAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),

      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(Gsize.defaulSpace),
        child: Column(
          children: [
            GSingleAddress(selectedAddress: true),
            GSingleAddress(selectedAddress: false)
          ],
        ),),
      ),
    );
  }
}