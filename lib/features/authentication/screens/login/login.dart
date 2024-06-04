import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/styles/spacing_styles.dart';
import 'package:product_share_suzuki/common/widgets/login_signup/form_divider.dart';
import 'package:product_share_suzuki/common/widgets/login_signup/social_buttons.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/widgets/login_form.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: GSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          // Logo, title & sub-title
          GloginHeader(),

          // Form
          GLoginForm(),

          // Divider
          GWidgetsFormDivider(),

          //Footer
          GWidgetSocialButtons()
        ],
      ),
    )));
  }
}
