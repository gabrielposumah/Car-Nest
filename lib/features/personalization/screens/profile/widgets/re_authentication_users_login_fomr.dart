import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/features/authentication/controllers/users/user_controller.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/validators/validators.dart';

class ReAuthenticationUsersLoginFomr extends StatelessWidget {
  const ReAuthenticationUsersLoginFomr({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authentication User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: GValidations.validateEmail,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email'),
                  ),
                  const SizedBox(height: Gsize.spaceBtwInputFields),

                  // Password
                  Obx(() => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            GValidations.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value,
                                icon: const Icon(Iconsax.eye_slash))),
                      )),
                  const SizedBox(height: Gsize.spaceBtwSections),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    
                  )
                ],
              )),
        ),
      ),
    );
  }
}
