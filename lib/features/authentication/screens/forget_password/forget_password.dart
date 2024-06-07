import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/validators/validators.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: const GAppBar(),
      body: Padding(padding: const EdgeInsets.all(Gsize.defaulSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headings
          Text('Change password', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: Gsize.spaceBtwItems),
          Text('', style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: Gsize.spaceBtwSections * 2),

          // Text Field
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
            controller: controller.email,
            validator: GValidations.validateEmail,
            decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
          )),

          const SizedBox(height: Gsize.spaceBtwSections),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.sendPasswordResetEmail(),
              child: const Text('Submit'),
            ))
        ],
      ),),
    );
  }
}