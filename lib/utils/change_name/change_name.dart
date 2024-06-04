import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/features/personalization/controllers/update_name/update_name_controller.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/validators/validators.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: GAppBar(
        showBackArrow: true,
        title: Text('Chane Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Gsize.defaulSpace),
        child: Column(
          children: [
            // Heading
            Text(
                'Use a real name for easy verification. this name will appear on several pages',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: Gsize.spaceBtwSections),

            // Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => GValidations.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: 'First Name', prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: Gsize.spaceBtwItems),
                    TextFormField(
                    controller: controller.lastName,
                    validator: (value) => GValidations.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              )),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Sava button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save'),),
              )
          ],
        ),
      ),
    );
  }
}
