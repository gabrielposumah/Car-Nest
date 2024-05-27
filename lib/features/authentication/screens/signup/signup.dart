import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/login_signup/form_divider.dart';
import 'package:product_share_suzuki/features/authentication/screens/signup/widgets/singup_form.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text("Let's Create Your Account",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Form
              const GSingupForm(),
              const SizedBox(height: Gsize.spaceBtwSections),

              // Divider
              const GWidgetsFormDivider(),
              const SizedBox(height: Gsize.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
