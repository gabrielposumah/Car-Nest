import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/features/authentication/controllers/singup/signup_controller.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/login.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';
import 'package:product_share_suzuki/utils/validators/validators.dart';

class GSingupForm extends StatelessWidget {
  const GSingupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        GValidations.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: Gsize.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        GValidations.validateEmptyText('last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Gsize.spaceBtwInputFields),

            // Username
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  GValidations.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: 'Username', prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(height: Gsize.spaceBtwInputFields),

            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => GValidations.validateEmail(value),
              obscureText: false,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Iconsax.direct)),
            ),

            const SizedBox(height: Gsize.spaceBtwInputFields),

            // Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => GValidations.validatePhoneNumber(value),
              obscureText: false,
              decoration: const InputDecoration(
                  labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call)),
            ),

            const SizedBox(height: Gsize.spaceBtwInputFields),
            //  Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => GValidations.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),

            const SizedBox(height: Gsize.spaceBtwSections),

            // Term n condition Checkbox
            Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(() => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value =
                            !controller.privacyPolicy.value))),
                const SizedBox(width: Gsize.spaceBtwItems),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'I agree to',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: ' Privacy Policy',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? Gcolors.white : Gcolors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? Gcolors.white : Gcolors.primary)),
                  TextSpan(
                      text: ' and',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: ' term of use',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? Gcolors.white : Gcolors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? Gcolors.white : Gcolors.primary)),
                ]))
              ],
            ),

            const SizedBox(height: Gsize.spaceBtwSections),

            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text('Create Account'))),
            const SizedBox(height: Gsize.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text('Create Account'))),
          ],
        ));
  }
}
