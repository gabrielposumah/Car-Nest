import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GSingupForm extends StatelessWidget {
  const GSingupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'First Name', prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: Gsize.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
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
          expands: false,
          decoration: const InputDecoration(
              labelText: 'Email', prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(height: Gsize.spaceBtwInputFields),

        // Email
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: 'Email', prefixIcon: Icon(Iconsax.direct)),
        ),

        const SizedBox(height: Gsize.spaceBtwInputFields),

        // Phone Number
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call)),
        ),

        const SizedBox(height: Gsize.spaceBtwInputFields),
        //  Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),

        const SizedBox(height: Gsize.spaceBtwSections),

        // Term n condition Checkbox
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {})),
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
                      decorationColor: dark ? Gcolors.white : Gcolors.primary)),
              TextSpan(
                  text: ' and', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ' term of use',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? Gcolors.white : Gcolors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? Gcolors.white : Gcolors.primary)),
            ]))
          ],
        ),

        const SizedBox(height: Gsize.spaceBtwSections),

        // Sign In Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: const Text('Create Account')),
        )
      ],
    ));
  }
}
