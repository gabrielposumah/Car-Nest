import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/route/navigation_menu.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class GLoginForm extends StatelessWidget {
  const GLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Gsize.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: 'E-mail'),
            ),
            const SizedBox(
              height: Gsize.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: 'Password',
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: Gsize.spaceBtwInputFields / 2,
            ),

            // Remember me & forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text('Remember me'),
                  ],
                ),

                // Forgot password

                TextButton(
                    onPressed: () {}, child: const Text('Forgot password'))
              ],
            ),
            const SizedBox(height: Gsize.spaceBtwSections),

            //Sign In buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: Gsize.spaceBtwItems),

            // Create Account
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(onPressed: () {}, child: Text('Sign In')),
            // ),
            //   const SizedBox(
            //   height: Gsize.spaceBtwSections,
            // )
          ],
        ),
      ),
    );
  }
}
