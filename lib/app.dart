import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:product_share_suzuki/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TappTheme.lightTheme,
      darkTheme: TappTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
