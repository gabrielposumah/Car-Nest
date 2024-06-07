import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/layout/grid_layout.dart';
import 'package:product_share_suzuki/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: Text('All Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            children: [
              // Drop down
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.sort),
                  ),
                  items: ['Name', 'Type', 'Passenger', 'Comercial', 'Price', '2 Row', '3 Row']
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  onChanged: (value) {}), 
                  
                  const SizedBox(height: Gsize.spaceBtwSections),

                  // Product
                  GGridLayout(itemCount: 4, itemBuilder: (_, index) => const GProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
